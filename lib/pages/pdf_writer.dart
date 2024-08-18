import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdf_maker/tools/pdf_tools.dart';

import '../widgets/pdf_form.dart';

class PdfWriter extends StatefulWidget {
  const PdfWriter({super.key,});

  @override
  State<PdfWriter> createState() => _PdfWriterState();
}

class _PdfWriterState extends State<PdfWriter> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PDF Writer"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const PdfFormWidget(),
            ElevatedButton(onPressed: () {
              PdfTools().createModernInvoicePdf();
            }, child: const Text("Save"))
          ],
        ),
      ),
    );
  }
}
