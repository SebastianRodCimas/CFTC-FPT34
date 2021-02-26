import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

//Meme code que touts les autres PDF//
void selectpdf() {}

class CAP extends StatefulWidget {
  @override
  _CAP createState() => _CAP();
}

class _CAP extends State<CAP> {
  PDFDocument
      _doc; //cette variable sera définis comme le PDF qu'on veut montrer
  bool _loading; //chargement

  void initState() {
    super.initState();
    _initPdf();
  }

  _initPdf() async {
    setState(() {
      _loading = true; //si le chargement du pdf est bon alors
    });
    final doc =
        await PDFDocument.fromAsset('docActu/cap.pdf'); //on montre le pdf
    setState(() {
      _doc = doc;
      _loading = false; //si le chargement est faux,reviens en arrière
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //Header//
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
        backgroundColor: Color(0xFF360C29),
        //page de chargement entre la page actualité et le pdf CAP
        body: _loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            //Package advance pdf, structure du pdf
            : PDFViewer(
                document: _doc,
                indicatorBackground: Color(4282856587),
                pickerIconColor: Colors.deepPurple,
                pickerButtonColor: Color(4278301376),
                showIndicator: true,
                showPicker: true,
              ));
  }
}
