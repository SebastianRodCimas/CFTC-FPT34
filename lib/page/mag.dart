import 'package:flutter/material.dart';
import 'package:image_ink_well/image_ink_well.dart';
import '../pdf-mag/voix3..dart';
import '../pdf-mag/voix1.dart';
import '../pdf-mag/voix2.dart';

class LeMag extends StatelessWidget {
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
                        fontSize: 14,
                        color: Color(0xFFFFFFFF),
                      )),
            ),
            Row(children: [
              Center(
                child: Text(
                  "   CFTC-FTP 34  ",
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
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

          //1

          ListTile(
            title: Text(
              '                          \n\n                          Mieux vaut faire soigner\n                          sa santé que sa maladie\n',
              style: TextStyle(
                color: Color(0xFF01B2C0),
                fontSize: 15,
                fontWeight: FontWeight.w900,
                fontFamily: "Oswald",
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new Voix1()));
            },
          ),
          Stack(
            children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: ImageInkWell(
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new Voix1()));
                    },
                    width: 190,
                    height: 110,
                    image: AssetImage('assets/voix-septembre.png'),
                  )),
            ],
          ),
          Align(
              alignment: Alignment.topRight,
              child: Text(
                '\nSeptembre 2020    ',
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
              '\n                           Reconnaître enfin le rôle \n                                essentiel de la FPT\n',
              style: TextStyle(
                color: Color(0xFF01B2C0),
                fontSize: 15,
                fontWeight: FontWeight.w700,
                fontFamily: "Oswald",
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new Voix2()));
            },
          ),
          Stack(children: [
            Align(
                alignment: Alignment.topCenter,
                child: ImageInkWell(
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new Voix2()));
                  },
                  width: 190,
                  height: 110,
                  image: AssetImage('assets/voix-juin.png'),
                )),
          ]),
          Align(
              alignment: Alignment.topRight,
              child: Text(
                '\nJuin 2020    ',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF028893),
                  fontSize: 14,
                  fontFamily: "PlayFairDisplay",
                  letterSpacing: 1,
                ),
              )),

          //2
          ListTile(
            title: Text(
              "                          L'avenir des retraites ne \n                          s'arrête pas avec le 49-3\n",
              style: TextStyle(
                color: Color(0xFF01B2C0),
                fontSize: 15,
                fontWeight: FontWeight.w900,
                fontFamily: "Oswald",
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new Voix3()));
            },
          ),
          Stack(children: [
            Align(
                alignment: Alignment.center,
                child: ImageInkWell(
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new Voix3()));
                  },
                  width: 190,
                  height: 110,
                  image: AssetImage('assets/voix-mars.png'),
                )),
          ]),
          Align(
              alignment: Alignment.topRight,
              child: Text(
                'Mars 2020    ',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF028893),
                  fontSize: 14,
                  fontFamily: "PlayFairDisplay",
                  letterSpacing: 1,
                ),
              )),

          //3
        ])));
  }
}
