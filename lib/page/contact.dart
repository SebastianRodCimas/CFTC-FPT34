import 'package:cftc_fpt_34/accueil/accueil.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// (si le lien marche,utiliser ceci)

//Lien Twitter du syndicat (non demandé au final)//
// ignore: unused_element
void _launchLink() async {
  const url = "https://twitter.com/SyndicatCFTC";

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw "Impossible de lancer le lien.";
  }
}

//Page qui permet de mettre les cooordonnées du syndicat
class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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

//Body
        backgroundColor: Color(0xFF302878),
        body: Center(

            //FD
            child: Stack(children: [
          Positioned(
              top: 40,
              left: 100,
              child: Text(
                "Fédération CFTC FPT",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF1D71B8),
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                  fontFamily: "Oswald",
                  letterSpacing: 1,
                ),
              )),
//Chaque Stack contient une icon avec son propre texte//
          Stack(children: [
            Positioned(
                top: 85.0,
                left: 260,
                child: Icon(
                  Icons.location_on_outlined,
                  color: Color(0xFF951B81),
                )),
          ]),

          Stack(children: [
            Positioned(
              top: 90.4,
              left: 25,
              child: Text('Bourse du Travail - 85 rue Charlot ',
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

          Stack(children: [
            Positioned(
                top: 123,
                left: 182,
                child: Icon(
                  Icons.home_work_outlined,
                  color: Color(0xFF951B81),
                )),
          ]),

          Stack(children: [
            Positioned(
              top: 130.4,
              left: 25,
              child: Text('75140 Paris Cedex 03 ',
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

          Stack(children: [
            Positioned(
                top: 163,
                left: 140,
                child: Icon(
                  Icons.local_phone_rounded,
                  color: Color(0xFF951B81),
                )),
          ]),

          Stack(children: [
            Positioned(
              top: 170.4,
              left: 25,
              child: Text('01 57 40 88 22 ',
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

          Stack(children: [
            Positioned(
                top: 205,
                left: 220,
                child: Icon(
                  Icons.mark_email_unread,
                  color: Color(0xFF951B81),
                )),
          ]),

          Stack(children: [
            Positioned(
              top: 210.4,
              left: 25,
              child: Text('cftcterritoriaux@orange.fr ',
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

          Stack(children: [
            Positioned(
                top: 245,
                left: 115,
                child: Icon(
                  Icons.web_outlined,
                  color: Color(0xFF951B81),
                )),
          ]),
          Stack(children: [
            Positioned(
              top: 250.4,
              left: 25,
              child: Text('fnact.com ',
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
/*
          Row(children: [
            Align(
                child: new AspectRatio(
                    aspectRatio: 5 / 54,
                    child: FlatButton(
                        onPressed: _launchLink,
                        child: Image.network("https://flutter.help/")))),
          ]),
*/
          //UD

          Stack(children: [
            Positioned(
                top: 340,
                left: 155,
                child: Text(
                  "UD 34",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF1D71B8),
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    fontFamily: "Oswald",
                    letterSpacing: 1,
                  ),
                )),
          ]),

          Stack(children: [
            Positioned(
              top: 395.4,
              left: 25,
              child:
                  Text('474 Allée Henri II de Montmorency,\n34000 Montpellier ',
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

          Stack(children: [
            Positioned(
                top: 395,
                left: 270,
                child: Icon(
                  Icons.location_on_outlined,
                  color: Color(0xFF951B81),
                )),
          ]),

          Stack(children: [
            Positioned(
              top: 470.4,
              left: 25,
              child: Text('04 67 15 14 47 ',
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

          Stack(children: [
            Positioned(
                top: 466,
                left: 140,
                child: Icon(
                  Icons.local_phone_rounded,
                  color: Color(0xFF951B81),
                )),
          ]),

          Stack(children: [
            Positioned(
              top: 530.4,
              left: 25,
              child: Text('ud34.cftc@free.fr',
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

          Stack(children: [
            Positioned(
                top: 526,
                left: 155,
                child: Icon(
                  Icons.mark_email_unread,
                  color: Color(0xFF951B81),
                )),
          ]),

          Stack(children: [
            Positioned(
              top: 600.4,
              left: 25,
              child: Text('Lundi au Jeudi 9h/12 14h/17h',
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

          Stack(children: [
            Positioned(
                top: 595,
                left: 235,
                child: Icon(
                  Icons.watch_later_rounded,
                  color: Color(0xFF951B81),
                )),
          ]),
        ])));
  }
}
