import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

File pdf;
void selectpdf() async {
  pdf = await FilePicker.getFile();
  print(pdf);
}

class Maladie extends StatefulWidget {
  @override
  _Maladie createState() => _Maladie();
}

class _Maladie extends State<Maladie> {
  PDFDocument _doc;
  bool _loading;

  void initState() {
    super.initState();
    _initPdf();
  }

  _initPdf() async {
    setState(() {
      _loading = true;
    });
    final doc = await PDFDocument.fromAsset('docMaladie/maladie-2019.pdf');
    setState(() {
      _doc = doc;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: <Widget>[
          Row(children: [
            Center(
              child:
                  Text("Syndicat Constructif,\nPartenaire du Dialogue Social",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: Color(4280498574),
                      )),
            ),
            Row(children: [
              Center(
                child: Text(
                  "   CFTC-FTP 34  ",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(4280498574),
                  ),
                ),
              ),
            ]),
          ]),
          Image.asset('assets/logo.png'),
        ]),

        //Body
        backgroundColor: Color(0xFF360C29),
        body: _loading
            ? Center(
                child: CircularProgressIndicator(),
              )
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
