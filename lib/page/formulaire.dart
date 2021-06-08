import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Formulaire extends StatefulWidget {
  @override
  _Formulaire createState() => _Formulaire();
}

class _Formulaire extends State<Formulaire> {
  String _nom;
  String _prenom;
  String _email;
  String _comment;
  String valuename;
  String valueprenom;
  String valuemail;

  Future postdata() async {
    Dio dio = new Dio();
    final String pathUrl = 'https://jsonplaceholder.typicode.com/posts';

    dynamic data = {
      'nom': 'Cimas',
      'prenom': 'Rodrigue',
      'email': 'rodrigue.cimas@xxxx.xx',
      'comment': 'requête en json'
    };
    var response = await dio.post(pathUrl,
        data: data,
        options: Options(headers: {
          'Content-type': 'application/json; charset=UTF-8',
        }));

    return response.data;
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildNom() {
    return TextFormField(
      style: TextStyle(color: Colors.lightBlue),
      decoration: InputDecoration(
        labelText: 'Nom',
        border: OutlineInputBorder(),
      ),
      maxLength: 15,
      validator: (String valuename) {
        if (valuename.isEmpty) {
          return 'Nom enregistré';
        }

        return null;
      },
      onSaved: (String valuename) {
        _nom = valuename;
      },
    );
  }

  Widget _buildPrenom() {
    return TextFormField(
      style: TextStyle(color: Colors.lightBlue),
      decoration: InputDecoration(
        labelText: 'Prénom',
        border: OutlineInputBorder(),
      ),
      maxLength: 20,
      validator: (String valueprenom) {
        if (valueprenom.isEmpty) {
          return 'Prénom enregistré';
        }

        return null;
      },
      onSaved: (String valueprenom) {
        _prenom = valueprenom;
      },
    );
  }

  Widget _buildMail() {
    return TextFormField(
      style: TextStyle(color: Colors.lightBlue),
      decoration: InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(),
      ),
      validator: (String valuemail) {
        if (valuemail.isEmpty) {
          return 'Email enregistré';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(valuemail)) {
          return 'Please entrée une adresse mail valide';
        }

        return null;
      },
      onSaved: (String valuemail) {
        _email = valuemail;
      },
    );
  }

  Widget _buildCommentaire() {
    return TextFormField(
      style: TextStyle(color: Colors.lightBlue),
      decoration: InputDecoration(
        labelText: 'Commentaire',
      ),
      maxLength: 150,
      cursorColor: Colors.blueAccent,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Commentaire enregistré';
        }

        return null;
      },
      onSaved: (String valuecommentaire) {
        _comment = valuecommentaire;
      },
    );
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(actions: <Widget>[
        Row(children: [
          Align(
            alignment: Alignment(1.50, -0.00),
            child: Row(children: [
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
      backgroundColor: Color(0xFF302878),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildNom(),
                _buildPrenom(),
                _buildMail(),
                _buildCommentaire(),
                SizedBox(height: 100),
                ElevatedButton(
                  child: Text(
                    'Envoyez',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }

                    _formKey.currentState.save();

                    print(_nom);
                    print(_prenom);
                    print(_email);
                    print(_comment);
                  },
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "afficher post",
        child: Icon(Icons.post_add_rounded),
        shape: CircleBorder(),
        splashColor: Color(0xFF940808),
        onPressed: () async {
          print('Post');
          await postdata().then((value) {
            print(value);
          });
        },
      ),
    );
  }
}
