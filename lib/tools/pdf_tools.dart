import 'dart:io';
import 'dart:ui';

import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class PdfTools {
  // Create a new PDF document

  void createPdf() async {
    final PdfDocument document = PdfDocument();
    document.pages.add().graphics.drawString(
        'This is a test', PdfStandardFont(PdfFontFamily.helvetica, 12),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(0, 0, 150, 20));

    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/PDFGen_${DateTime.now().millisecondsSinceEpoch}.pdf';

    // Save the document.
    File(path).writeAsBytes(await document.save());
    print("Pdf Saved");
    // Dispose the document.
    document.dispose();
  }

  Future<List<FileSystemEntity>> getAllPdfFiles() async {
    // Get the directory where the PDFs are saved.
    final directory = await getApplicationDocumentsDirectory();

    // List all files in the directory.
    List<FileSystemEntity> files = directory.listSync();

    // Filter the list to include only PDF files.
    List<FileSystemEntity> pdfFiles = files.where((file) {
      return file.path.endsWith('.pdf');
    }).toList();

    return pdfFiles;
  }
}
