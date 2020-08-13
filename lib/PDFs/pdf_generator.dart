import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PDFGenerator extends StatefulWidget {
  @override
  _PDFGeneratorState createState() => _PDFGeneratorState();
}

class _PDFGeneratorState extends State<PDFGenerator> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<Directory> docDir;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future<Directory> docDir = getApplicationDocumentsDirectory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Generator'),
      ),
      body: Container(
        child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                TextFormField(),
                TextFormField(),
                TextFormField(),
                TextFormField(),
              ],
            )),
      ),
      floatingActionButton: RaisedButton(
        child: Text('Generate'),
        onPressed: null,
      ),
    );
  }
}
