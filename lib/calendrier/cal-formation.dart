import 'dart:convert';
import 'package:cftc_fpt_34/accueil/accueil.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendrier1 extends StatefulWidget {
  @override
  _Calendrier1State createState() => _Calendrier1State();
}

//? Cette class va regroup toutes les variables utiliser dans le calendrier//
class _Calendrier1State extends State<Calendrier1> {
  SharedPreferences prefs; //!Provient du package shared_preferences.dart';//
  CalendarController
      _controller; //!Provient du package table_calendar pour créer un calendrier//
  Map<DateTime, List<dynamic>>
      _formation; //!Liste dynamic qui va permettre d'ajouté une formation//
  TextEditingController
      _formationController; //*!Cette variable va pouvoir écrire un texte quand on va add une formation//
  List<dynamic>
      _selectformation; //!Seconde liste on va pouvoir select une formation sur le calendrier//
  bool isButtonPressed =
      false; //!Si le button est faux , renvoie vers a la page initiale//

  @override
  void initState() {
    //?Cette méthode  est utilisé lorsque le widget est inséré dans l'arbre des widgets
    super
        .initState(); //?Cette méthode est la meilleur méthode pour initialiser les données qui reposent sur le BuildContext
    _selectformation = [];
    _controller = CalendarController();
    _formation = {};
    _formationController = TextEditingController();

    initPrefs();
  }

  initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _formation = Map<DateTime, List<dynamic>>.from(
          decodeMap(json.decode(prefs.getString("formation") ?? "{}")));
    }); //?json qui est decode en étant relier à la liste dynamic _formation
  }

  Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
    Map<String, dynamic> newMap = {};
    map.forEach((key, value) {
      // exécute une fonction donnée sur chaque élément clé-valeur.
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }

  Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
    Map<DateTime, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Header
      appBar: AppBar(actions: <Widget>[
        Row(children: [
          Align(
            alignment: Alignment(1.50, -0.00),
            child: Row(children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_left_sharp,
                  color: Colors.blue.shade400,
                ),
                iconSize: 37,
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new Accueil()));
                },
              ),
              Center(
                child: Text(
                    "   Syndicat Constructif,\n  Partenaire du Dialogue Social",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 11,
                      color: Color(4280498574),
                    )),
              ),
              Row(children: [
                Center(
                  child: Text(
                    "CFTC-FTP 34",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w800,
                      color: Color(4280498574),
                    ),
                  ),
                ),
              ]),
              Image.asset('assets/logo.png'),
            ]),
          )
        ])
      ]),
      backgroundColor: Color(4278301376),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
            color: Colors.white,
          )),

          //Structure de la formation//
          TableCalendar(
            events: _formation,
            initialCalendarFormat: CalendarFormat.month,
            calendarStyle: CalendarStyle(
                weekendStyle: TextStyle(
                  color: Color(4280498574),
                  fontWeight: FontWeight.w600,
                ),
                weekdayStyle: TextStyle(color: Colors.white),
                outsideWeekendStyle: TextStyle(color: Color(4284618570)),
                outsideStyle: TextStyle(
                  color: Color(4282856587),
                  fontWeight: FontWeight.w600,
                ),
                canEventMarkersOverflow: true,
                todayColor: Color(0xFF47348B),
                selectedColor: Theme.of(context).primaryColor,
                renderDaysOfWeek: false,
                todayStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.white)),
            headerStyle: HeaderStyle(
              leftChevronIcon: Icon(Icons.arrow_back_ios,
                  size: 15, color: Color(4282856587)),
              rightChevronIcon: Icon(Icons.arrow_forward_ios,
                  size: 15, color: Color(4281346168)),
              titleTextStyle: GoogleFonts.montserrat(
                  color: Color(4282856587),
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
              formatButtonTextStyle: TextStyle(
                color: Color(4281346168),
                fontWeight: FontWeight.bold,
                fontSize: 13.5,
              ),
              formatButtonShowsNext: false,
            ),
            startingDayOfWeek: StartingDayOfWeek.monday,
            onDaySelected: (date, events, _) {
              setState(() {
                _selectformation = events;
              });
            },
            builders: CalendarBuilders(
              selectedDayBuilder: (context, date, events) => Container(
                  margin: const EdgeInsets.all(4.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(7.0)),
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(color: Colors.white),
                  )),
              todayDayBuilder: (context, date, events) => Container(
                  margin: const EdgeInsets.all(4.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color(0xFF47348B),
                      borderRadius: BorderRadius.circular(7.0)),
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            calendarController: _controller,
          ),
          ..._selectformation.map((formation) => ListTile(
                title: Text(formation),
                contentPadding: EdgeInsets.fromLTRB(50, 5, 0, 0),
                selected: true,
                selectedTileColor: Color(0xFF47348B),
              )),

          /* Boutton pour remove une formation (relier  à la fonction instable)
              Stack(
                children: <Widget>[
                  Positioned(
                    left: 25,
                    top: 10,
                    child: FloatingActionButton(
                      heroTag: "supprimer une formation",
                      child: Icon(Icons.remove_circle_outline_rounded),
                      splashColor: Color(4282856587),
                      onPressed: _removeFormation,
                      backgroundColor: Colors.blue,
                      foregroundColor: Color(4282856587),
                    ),
                  ),
                  */

          Stack(children: <Widget>[
            Align(
              alignment: Alignment(0.00, 0.00),
              child: Text(
                "\n\n\n\n\nCalendrier des formations",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 19,
                  color: Color(4280498574),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ]),
        ],
      )),

      //Bouton pour add une formation
      floatingActionButton: FloatingActionButton(
          heroTag: "ajouter une formation",
          shape: CircleBorder(),
          child: Icon(Icons.add),
          splashColor: Color(0xFF23398E),
          onPressed: _addFormation,
          foregroundColor: Color(4280498574)),
    );
  }

//!Fonction qui add une formation

  _addFormation() async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              //*On utilise alerte dialog pour relier le controller et _formationController
              content: TextField(
                controller: _formationController,
              ),
              actions: <Widget>[
                TextButton(
                  child: Text("Ajouté une formation"),
                  onPressed: () {
                    if (_formationController.text.isEmpty)
                      return; //?Si le bouton retourne du text
                    if (_formation[_controller.selectedDay] != null) {
                      //?Si lee bouton sélectionner est différent de null
                      _formation[_controller.selectedDay].add(_formationController
                          .text); //?Alors sa ajouté une formation sur le calendriers
                    } else {
                      _formation[_controller.selectedDay] = [
                        _formationController.text
                      ];
                    }
                    prefs.setString(
                        "formation", json.encode(encodeMap(_formation)));
                    _formationController.clear();
                    Navigator.pop(
                        context); //Ce Json permet de garder l'affichage de la formation sur le calendrier
                  },
                )
              ],
            ));
    setState(() {
      _selectformation = _formation[_controller.selectedDay];
    });
  }
}


/*  Fonction Remove Instable
     _removeFormation() async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(
                controller: _formationController,
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text("Enlevez une formation"),
                  onPressed: () {
                    if (_formationController.text.isEmpty) return;
                    if (_formation[_controller.selectedDay] != null) {
                      _formation[_controller.selectedDay]
                          .remove(_formationController.text);
                    } else {
                      _formation[_controller.selectedDay] = [
                        _formationController.text
                      ];
                    }
                    prefs.setString(
                        "formation", json.encode(encodeMap(_formation)));
                    _formationController.clear();
                    Navigator.pop(context);
                  },
                )
              ],
            ));
    setState(() {
      _selectformation = _formation[_controller.selectedDay];
    });
  }
  */
