import 'package:cftc_fpt_34/pdf-agent/agents.dart';
import 'package:flutter/material.dart';
import 'package:image_ink_well/image_ink_well.dart';

//package utilisé depuis pubspecyaml
class Agent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        //Header
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
          //Titre ayant comme lien le PDF qui lui est attritré
          ListTile(
            title: Text(
              "                      Guides de l'agent",
              style: TextStyle(
                color: Color(0xFF01B2C0),
                fontSize: 18,
                fontWeight: FontWeight.w900,
                fontFamily: "Oswald",
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new Agents()));
            },
          ),
          //Image ayant comme lien le PDF qui lui est attritré
          Stack(
            children: [
              Align(
                  alignment: Alignment.center,
                  child: ImageInkWell(
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new Agents()));
                    },
                    width: 250,
                    height: 160,
                    image: AssetImage('assets/agent.png'),
                  )),
            ],
          ),
          Align(
              alignment: Alignment.topRight,
              child: Text(
                '\n2020-2021-2022   ',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF028893),
                  fontSize: 14,
                  fontFamily: "PlayFairDisplay",
                  letterSpacing: 1,
                ),
              ))
        ])));
  }
}
