import 'package:cftc_fpt_34/pdf-actu/cap.dart';
import 'package:cftc_fpt_34/pdf-actu/collectivites.dart';
import 'package:cftc_fpt_34/pdf-actu/deces.dart';
import 'package:cftc_fpt_34/pdf-actu/egalite.dart';
import 'package:cftc_fpt_34/pdf-actu/enfant.dart';
import 'package:cftc_fpt_34/pdf-actu/fonctionpublique.dart';
import 'package:cftc_fpt_34/pdf-actu/police.dart';
import 'package:cftc_fpt_34/pdf-actu/rifseep.dart';
import 'package:cftc_fpt_34/pdf-actu/ultramarin.dart';
import 'package:flutter/material.dart';
import 'package:image_ink_well/image_ink_well.dart';
import '../pdf-actu/protectionsocial.dart';

//touts les pages sont relié afin que chaque page soit relié à son PDF
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
            //ListView pour faire pluseiurs ListTitle sous forme de colonne
            child: ListView(children: <Widget>[
          Container(child: Column(children: <Widget>[])),
          //Config du titre
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
            //Une fois cliqué dessus, ça nous dirige vers le PDF demandé
            onTap: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new PS()));
            },
          ),

          //Image pour présenter le titre
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
          //Titre mis pour montrer si c'est plus ou moin réçent
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
          ListTile(
            title: Text(
              '           La réforme des congés bonifiés des \n           agents ultramarins entre en vigueur',
              style: TextStyle(
                color: Color(0xFF01B2C0),
                fontSize: 14.5,
                fontWeight: FontWeight.w900,
                fontFamily: "Oswald",
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new UM()));
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
                              builder: (context) => new UM()));
                    },
                    width: 200,
                    height: 95,
                    image: AssetImage('assets/ultramarin.png'),
                  )),
            ],
          ),
          Align(
              alignment: Alignment.topRight,
              child: Text(
                '\n7 Juillet 2020    ',
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
          ListTile(
            title: Text(
              "                 Congé pour le conjoint en cas \n                  d'hospitalisation d'un enfant",
              style: TextStyle(
                color: Color(0xFF01B2C0),
                fontSize: 15,
                fontWeight: FontWeight.w900,
                fontFamily: "Oswald",
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new Enfant()));
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
                              builder: (context) => new Enfant()));
                    },
                    width: 200,
                    height: 95,
                    image: AssetImage('assets/enfant.png'),
                  )),
            ],
          ),
          Align(
              alignment: Alignment.topRight,
              child: Text(
                '\n2 Juillet 2020    ',
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
          ListTile(
            title: Text(
              "          L’engagement des policiers municipaux \n                          reconnu par décret",
              style: TextStyle(
                color: Color(0xFF01B2C0),
                fontSize: 15,
                fontWeight: FontWeight.w900,
                fontFamily: "Oswald",
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new Police()));
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
                              builder: (context) => new Police()));
                    },
                    width: 150,
                    height: 125,
                    image: AssetImage('assets/police.png'),
                  )),
            ],
          ),
          Align(
              alignment: Alignment.topRight,
              child: Text(
                '\n16 Juin 2020    ',
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
          ListTile(
            title: Text(
              "                       Egalité professionnelle :\n       quelles obligations pour les collectivités ?",
              style: TextStyle(
                color: Color(0xFF01B2C0),
                fontSize: 15,
                fontWeight: FontWeight.w900,
                fontFamily: "Oswald",
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new Egalite()));
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
                              builder: (context) => new Egalite()));
                    },
                    width: 170,
                    height: 115,
                    image: AssetImage('assets/egaliteprof.png'),
                  )),
            ],
          ),
          Align(
              alignment: Alignment.topRight,
              child: Text(
                '\n15 Juin 2020    ',
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
          ListTile(
            title: Text(
              "                   Le congé à la suite du décès\n                      d'un enfant est allongé ?",
              style: TextStyle(
                color: Color(0xFF01B2C0),
                fontSize: 15,
                fontWeight: FontWeight.w900,
                fontFamily: "Oswald",
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new Deces()));
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
                              builder: (context) => new Deces()));
                    },
                    width: 200,
                    height: 95,
                    image: AssetImage('assets/deces.png'),
                  )),
            ],
          ),
          Align(
              alignment: Alignment.topRight,
              child: Text(
                '\n10 Juin 2020    ',
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
          ListTile(
            title: Text(
              "         Transformation de la fonction publique :\n       Nouveau train de mesures réglementaires",
              style: TextStyle(
                color: Color(0xFF01B2C0),
                fontSize: 15,
                fontWeight: FontWeight.w900,
                fontFamily: "Oswald",
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new FP()));
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
                              builder: (context) => new FP()));
                    },
                    width: 200,
                    height: 95,
                    image: AssetImage('assets/fonctionpublique.png'),
                  )),
            ],
          ),
          Align(
              alignment: Alignment.topRight,
              child: Text(
                '\n11 Mai 2020    ',
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
          ListTile(
            title: Text(
              "                        Régime indemnitaire :",
              style: TextStyle(
                color: Color(0xFF01B2C0),
                fontSize: 15,
                fontWeight: FontWeight.w900,
                fontFamily: "Oswald",
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new Rifseep()));
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
                              builder: (context) => new Rifseep()));
                    },
                    width: 200,
                    height: 95,
                    image: AssetImage('assets/rifseep.png'),
                  )),
            ],
          ),
          Align(
              alignment: Alignment.topRight,
              child: Text(
                '\n3 Mars 2020    ',
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
          ListTile(
            title: Text(
              "           Décryptage du nouveau rôle des \n     commissions administratives paritaires",
              style: TextStyle(
                color: Color(0xFF01B2C0),
                fontSize: 15,
                fontWeight: FontWeight.w900,
                fontFamily: "Oswald",
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new CAP()));
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
                              builder: (context) => new CAP()));
                    },
                    width: 200,
                    height: 95,
                    image: AssetImage('assets/cap.png'),
                  )),
            ],
          ),
          Align(
              alignment: Alignment.topRight,
              child: Text(
                '\n22 Janvier 2020    ',
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
          ListTile(
            title: Text(
              "                                Collectivités : \n            ce qui a changé le 1er janvier 2020",
              style: TextStyle(
                color: Color(0xFF01B2C0),
                fontSize: 15,
                fontWeight: FontWeight.w900,
                fontFamily: "Oswald",
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new Collect()));
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
                              builder: (context) => new Collect()));
                    },
                    width: 200,
                    height: 95,
                    image: AssetImage('assets/collectivites.png'),
                  )),
            ],
          ),
          Align(
              alignment: Alignment.topRight,
              child: Text(
                '\n13 Janvier 2020    ',
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
