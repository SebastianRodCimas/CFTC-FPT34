import 'package:cftc_fpt_34/calendrier/cal-syndicat.dart';
import 'package:cftc_fpt_34/page/agent.dart';
import 'package:cftc_fpt_34/page/json.dart';
import 'package:flutter/material.dart';
import '../calendrier/cal-formation.dart';
import '../page/conges.dart';
import '../page/contact.dart';
import '../page/mag.dart';
import '../page/actualite.dart';
import '../page/json.dart';

class Accueil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        //Menu Body
//Liste du Drawer avec chaque onglets
        drawer: Drawer(
          child: ListView(children: <Widget>[
            DrawerHeader(
                child: Container(
                    child: Column(children: <Widget>[
              Stack(
                children: [
                  Align(
                      child: new AspectRatio(
                    aspectRatio: 4.57 / 2.3,
                    child: Image.asset('assets/logo.png'),
                  ))
                ],
              ),
            ]))),
            ListTile(
              title: Text(
                '                     Actualités',
                style: TextStyle(
                  color: Color(0xFF951B81),
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new Actualite()));
              },
            ),
            new ListTile(
              title: new Text(
                "        Calendrier des journées\n                     syndicales",
                style: TextStyle(
                  color: Color(0xFF951B81),
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new Calendrier2()));
              },
            ),
            new ListTile(
              title: new Text(
                "      Calendrier des formations",
                style: TextStyle(
                  color: Color(0xFF951B81),
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new Calendrier1()));
              },
            ),
            new ListTile(
              title: new Text(
                "                Guide de l'agent",
                style: TextStyle(
                  color: Color(0xFF951B81),
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new Agent()));
              },
            ),
            new ListTile(
              title: new Text(
                "    Guide des congés maladies",
                style: TextStyle(
                  color: Color(0xFF951B81),
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new Conges()));
              },
            ),
            new ListTile(
              title: new Text(
                "                      Le Mag",
                style: TextStyle(
                  color: Color(0xFF951B81),
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new LeMag()));
              },
            ),
            new ListTile(
              title: new Text(
                "                      Contact",
                style: TextStyle(
                  color: Color(0xFF951B81),
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new Contact()));
              },
            ),
            new ListTile(
              title: new Text(
                "                    Formulaire",
                style: TextStyle(
                  color: Color(0xFF951B81),
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new Formulaire()));
              },
            ),

            //Image pour ceux qui soutiennt le syndicat
            Stack(children: [
              Align(
                  child: new AspectRatio(
                      aspectRatio: 10 / 2.3,
                      child: new Container(
                          decoration: new BoxDecoration(
                              image: new DecorationImage(
                        fit: BoxFit.contain,
                        alignment: Alignment(-0.35, 0.00),
                        image: new AssetImage('assets/mutuel.png'),
                      ))))),
              Stack(children: [
                Align(
                    child: new AspectRatio(
                        aspectRatio: 10 / 2.3,
                        child: new Container(
                            decoration: new BoxDecoration(
                                image: new DecorationImage(
                          fit: BoxFit.contain,
                          alignment: Alignment(0.31, 0.00),
                          image: new AssetImage('assets/macif.jpg'),
                        ))))),
                Stack(children: [
                  Align(
                      child: new AspectRatio(
                          aspectRatio: 10 / 2.3,
                          child: Container(
                              decoration: new BoxDecoration(
                                  image: new DecorationImage(
                            fit: BoxFit.contain,
                            alignment: Alignment.bottomLeft,
                            image: new AssetImage('assets/epsi.png'),
                          ))))),
                  Stack(children: [
                    Align(
                        child: new AspectRatio(
                            aspectRatio: 10 / 2.3,
                            child: new Container(
                                decoration: new BoxDecoration(
                                    image: new DecorationImage(
                              fit: BoxFit.contain,
                              alignment: Alignment.bottomRight,
                              image: new AssetImage('assets/prefon.jpg'),
                            ))))),
                  ]),
                ]),
              ]),
            ]),
          ]),
        ),

        //Header Body

        appBar: AppBar(actions: <Widget>[
          Row(children: [
            Center(
              child:
                  Text("Syndicat Constructif,\n  Partenaire du Dialogue Social",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 11.0,
                        color: Color(4280498574),
                      )),
            ),
            Row(children: [
              Center(
                child: Text(
                  "   CFTC-FTP 34  ",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w800,
                    color: Color(4280498574),
                  ),
                ),
              ),
            ]),
          ]),
          Image.asset('assets/logo.png'),
        ]),

        //Main Body
        backgroundColor: Color(0xFF302878),
        body: Center(
            child: Stack(fit: StackFit.expand, children: [
          Positioned(
              top: 130,
              left: 55,
              child: Text(
                "Un syndicat constructif,\n qui vous accompagne tout au\n long de votre vie professionnelle",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF01B2C0),
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  fontFamily: "Oswald",
                  letterSpacing: 1,
                ),
              )),
          Stack(fit: StackFit.expand, children: [
            Align(
              alignment: Alignment(0.00, -0.02),
              child: Image.asset('assets/mongolfiere.jpeg'),
            ),
            Stack(children: [
              Positioned(
                bottom: 120.4,
                left: 35,
                child: Text(
                    '474 Allée Henri II de Montmorency,\n 34000 Montpellier\n04 67 15 14 47\nsyndicat.cftc.territoriaux.34@gmail.com\nSyndicat CFTC ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF01B2C0),
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      fontFamily: "PlayFairDisplay",
                      letterSpacing: 1,
                    )),
              )
            ]),
          ])
        ])));
  }
}
