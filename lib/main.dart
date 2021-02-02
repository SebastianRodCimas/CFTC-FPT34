import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'accueil/accueil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Screen(),
      title: 'CFTC',
      theme: ThemeData(
        backgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 4,
      backgroundColor: Color(4281415051),
      image: Image.asset('assets/logo.png'),
      loaderColor: Color(4279598252),
      photoSize: 80.0,
      navigateAfterSeconds: Accueil(),
    );
  }
}
