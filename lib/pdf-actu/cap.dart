import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

void selectpdf() {}

class CAP extends StatefulWidget {
  @override
  _CAPState createState() => _CAPState();
}

class _CAPState extends State<CAP> {
  static final int _initialPage = 2;
  int _actualPageNumber = _initialPage, _allPagesCount = 0;
  bool isSampleDoc = true;
  PdfController _pdfController;

  @override
  void initState() {
    _pdfController = PdfController(
      document: PdfDocument.openAsset('docActu/protectionsociale-decembre.pdf'),
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
        theme: ThemeData(primaryColor: Colors.white),
        home: Scaffold(
          appBar: AppBar(
            title: Text('YES'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.navigate_before),
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
                  style: TextStyle(fontSize: 22),
                ),
              ),
              IconButton(
                icon: Icon(Icons.navigate_next),
                onPressed: () {
                  _pdfController.nextPage(
                    curve: Curves.ease,
                    duration: Duration(milliseconds: 100),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  if (isSampleDoc) {
                    _pdfController.loadDocument(PdfDocument.openFile(
                        'docActu/protectionsociale-decembre.pdf'));
                  } else {
                    _pdfController.loadDocument(PdfDocument.openFile(
                        'docActu/protectionsociale-decembre.pdf'));
                  }
                  isSampleDoc = !isSampleDoc;
                },
              )
            ],
          ),
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
