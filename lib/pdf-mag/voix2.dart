import 'package:cftc_fpt_34/page/mag.dart';
import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

void selectpdf() {}

class Voix2 extends StatefulWidget {
  @override
  _Voix2State createState() => _Voix2State();
}

class _Voix2State extends State<Voix2> {
  static final int _initialPage = 1;
  int _actualPageNumber = _initialPage, _allPagesCount = 0;
  PdfController _pdfController;

  @override
  void initState() {
    _pdfController = PdfController(
      document: PdfDocument.openAsset('docMag/lavoix-juin.pdf'),
      initialPage: _initialPage,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pdfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(primaryColor: Colors.lightBlueAccent),
        home: Scaffold(
          appBar: AppBar(actions: <Widget>[
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_sharp),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new LeMag()));
                  },
                ),
                Center(
                  child: Text("     Voix de Juin   ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 15.0,
                        color: Color(4280498574),
                      )),
                ),
                IconButton(
                  icon: Icon(Icons.navigate_before),
                  color: Color(4280498574),
                  onPressed: () {
                    _pdfController.previousPage(
                      curve: Curves.ease,
                      duration: Duration(milliseconds: 100),
                    );
                  },
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    '$_actualPageNumber/$_allPagesCount',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(4280498574),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.navigate_next),
                  color: Color(4280498574),
                  onPressed: () {
                    _pdfController.nextPage(
                      curve: Curves.ease,
                      duration: Duration(milliseconds: 100),
                    );
                  },
                ),
                Image.asset('assets/logo.png'),
              ],
            ),
          ]),
          backgroundColor: Color(0xFF302878),
          body: PdfView(
            documentLoader: Center(child: CircularProgressIndicator()),
            pageLoader: Center(child: CircularProgressIndicator()),
            controller: _pdfController,
            onDocumentLoaded: (document) {
              setState(() {
                _allPagesCount = document.pagesCount;
              });
            },
            onPageChanged: (page) {
              setState(() {
                _actualPageNumber = page;
              });
            },
          ),
        ),
      );
}
