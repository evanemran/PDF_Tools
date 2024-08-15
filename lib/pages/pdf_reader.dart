import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfReader extends StatefulWidget {
  const PdfReader({super.key, required this.file});

  final FileSystemEntity file;

  @override
  State<PdfReader> createState() => _PdfReaderState();
}

class _PdfReaderState extends State<PdfReader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PDF Reader"),
        centerTitle: true,
      ),

      body: Center(
        child: SfPdfViewer.file(
            File(widget.file.path)),
      ),
    );
  }
}
