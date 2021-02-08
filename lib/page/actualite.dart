import 'package:flutter/material.dart';
import 'package:image_ink_well/image_ink_well.dart';
import '../pdf-actu/ps1.dart';

class Actualite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
        //Body
        backgroundColor: Color(0xFF47348B),
        body: Center(
            child: ListView(children: <Widget>[
          Container(child: Column(children: <Widget>[])),
          ListTile(
            title: Text(
              '                         Protection Sociale',
              style: TextStyle(
                color: Color(0xFF01B2C0),
                fontSize: 16,
                fontWeight: FontWeight.w900,
                fontFamily: "Oswald",
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new PS()));
            },
          ),
          Stack(
            children: [
              Align(
                  alignment: Alignment.center,
                  child: ImageInkWell(
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new PS()));
                    },
                    width: 200,
                    height: 95,
                    image: AssetImage('assets/protectionsocial.jpeg'),
                  )),
            ],
          ),
          Align(
              alignment: Alignment.topRight,
              child: Text(
                '\nFin 2020    ',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF028893),
                  fontSize: 14,
                  fontFamily: "PlayFairDisplay",
                  letterSpacing: 1,
                ),
              )),
        ])));
  }
}
