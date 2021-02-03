import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendrier1 extends StatefulWidget {
  @override
  _CalendrierState createState() => _CalendrierState();
}

class _CalendrierState extends State<Calendrier1> {
  SharedPreferences prefs;
  CalendarController _controller;
  Map<DateTime, List<dynamic>> _formation;
  TextEditingController _formationController;
  List<dynamic> _selectformation;
  bool isButtonPressed = false;

  @override
  void initState() {
    super.initState();
    _selectformation = [];
    _controller = CalendarController();
    _formation = {};
    _formationController = TextEditingController();

    initPrefs();
  }

  initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _formation = Map<DateTime, List<dynamic>>.from(encodeMap(
          json.decode(prefs.getString("events") ?? "{ajouté quelquechose}")));
    });
  }

  Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
    Map<String, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: <Widget>[
          Row(children: [
            Center(
              child:
                  Text("Syndicat Constructif,\nPartenaire du Dialogue Social",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                       fontSize: 12.4,
                        color: Color(4280498574),
                      )),
            ),
            Row(children: [
              Center(
                child: Text(
                  "   CFTC-FTP 34  ",
                  style: TextStyle(
                    fontSize: 12.4,
                    fontWeight: FontWeight.w800,
                    color: Color(4280498574),
                  ),
                ),
              ),
            ]),
          ]),
          Image.asset('assets/logo.png'),
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
                  Positioned(
                    right: 25,
                    top: 10,
                    child: FloatingActionButton(
                        heroTag: "ajouter une formation",
                        shape: CircleBorder(),
                        child: Icon(Icons.add),
                        splashColor: Color(0xFF23398E),
                        onPressed: _addFormation,
                        foregroundColor: Color(4280498574)),
                  ),
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
                  ])
                ],
              )
            ])));
  }

  _addFormation() async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(
                controller: _formationController,
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text("Ajouté une formation"),
                  onPressed: () {
                    if (_formationController.text.isEmpty) return;
                    if (_formation[_controller.selectedDay] != null) {
                      _formation[_controller.selectedDay]
                          .add(_formationController.text);
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
}
