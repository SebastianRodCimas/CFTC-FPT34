import 'package:cftc/pdf-agent/agents.dart';
import 'package:flutter/material.dart';
import 'package:image_ink_well/image_ink_well.dart';

class Agent extends StatelessWidget {
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
          ListTile(
            title: Text(
              "                          Guides de l'agent",
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
