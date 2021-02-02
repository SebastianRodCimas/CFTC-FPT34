import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

void selectpdf() {}

class PS extends StatefulWidget {
  @override
  _PS createState() => _PS();
}

class _PS extends State<PS> {
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
    final doc =
        await PDFDocument.fromAsset('docActu/protectionsociale-decembre.pdf');
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
