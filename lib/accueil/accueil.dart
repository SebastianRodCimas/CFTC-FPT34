import 'package:cftc_fpt_34/calendrier/cal-syndicat.dart';
import 'package:cftc_fpt_34/page/agent.dart';
import 'package:flutter/material.dart';
import '../calendrier/cal-formation.dart';
import '../page/conges.dart';
import '../page/contact.dart';
import '../page/mag.dart';
import '../page/actualite.dart';

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
                        image: new NetworkImage(
                            'https://media-exp1.licdn.com/dms/image/C560BAQHCQ9s-60QB7A/company-logo_200_200/0/1519884257074?e=2159024400&v=beta&t=6l6TIvYycZFgzRvX_RdUO0PAfZ2Bczgk00IJVFaAX6c'),
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
                          image: new NetworkImage(
                              'https://reassurez-moi.fr/guide/wp-content/uploads/2019/02/macif-contact-assistance.jpg'),
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
                            image: new NetworkImage(
                                'https://www.figs-education.com/wp-content/uploads/2020/09/logoepsi-400x400.png'),
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
                              image: new NetworkImage(
                                  'https://www.plurelya.fr/wp-content/uploads/Prefon.jpg'),
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

        //Main Body
        backgroundColor: Color(0xFF302878),
        body: Center(
            child: Stack(children: [
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
          Spacer(),
          Stack(children: [
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
