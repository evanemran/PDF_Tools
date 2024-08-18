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

  void createInvoicePdf() async {
    // Create a new PDF document
    final PdfDocument document = PdfDocument();

    // Add a page to the document
    final PdfPage page = document.pages.add();

    // Create a PDF graphics object
    final PdfGraphics graphics = page.graphics;

    // Set the page size (A4)
    page.getClientSize();

    // Define fonts
    final PdfFont titleFont = PdfStandardFont(PdfFontFamily.helvetica, 24, style: PdfFontStyle.bold);
    final PdfFont headerFont = PdfStandardFont(PdfFontFamily.helvetica, 18, style: PdfFontStyle.bold);
    final PdfFont regularFont = PdfStandardFont(PdfFontFamily.helvetica, 12);

    // Draw the title
    graphics.drawString(
        'INVOICE',
        titleFont,
        bounds: const Rect.fromLTWH(0, 0, 500, 50),
        format: PdfStringFormat(alignment: PdfTextAlignment.center)
    );

    // Draw the header
    graphics.drawString(
      'Company Name',
      headerFont,
      bounds: const Rect.fromLTWH(0, 60, 500, 30),
    );

    graphics.drawString(
      'Address Line 1\nAddress Line 2',
      regularFont,
      bounds: const Rect.fromLTWH(0, 100, 500, 50),
    );

    // Draw the invoice info
    graphics.drawString(
      'Invoice Number: 12345\nDate: 01/01/2024\nDue Date: 15/01/2024',
      regularFont,
      bounds: const Rect.fromLTWH(0, 160, 500, 50),
    );

    // Draw the recipient details
    graphics.drawString(
      'Bill To:\nCustomer Name\nCustomer Address Line 1\nCustomer Address Line 2',
      regularFont,
      bounds: const Rect.fromLTWH(0, 230, 500, 70),
    );

    // Draw the table header
    graphics.drawString(
      'Description                  Quantity         Unit Price         Total',
      headerFont,
      bounds: const Rect.fromLTWH(0, 310, 500, 30),
    );

    // Draw the table rows
    graphics.drawString(
      'Product 1                      1                   \$100              \$100\n'
          'Product 2                      2                   \$50                \$100\n'
          'Product 3                      3                   \$30                \$90',
      regularFont,
      bounds: const Rect.fromLTWH(0, 350, 500, 100),
    );

    // Draw the total amount
    graphics.drawString(
      'Total: \$290',
      headerFont,
      bounds: const Rect.fromLTWH(0, 460, 500, 30),
      format: PdfStringFormat(alignment: PdfTextAlignment.right),
    );

    // Save the document
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/Invoice_${DateTime.now().millisecondsSinceEpoch}.pdf';

    // Save the document.
    File(path).writeAsBytes(await document.save());
    document.dispose();
  }

  Future<void> createModernInvoicePdf() async {
    // Create a new PDF document
    final PdfDocument document = PdfDocument();

    // Add a page to the document
    final PdfPage page = document.pages.add();

    // Set the page size (A4)
    final Size pageSize = page.getClientSize();

    // Define colors
    final PdfColor backgroundColor = PdfColor(241, 245, 248);
    final PdfColor primaryColor = PdfColor(34, 40, 49);
    final PdfColor secondaryColor = PdfColor(57, 62, 70);
    final PdfColor accentColor = PdfColor(0, 173, 181);

    // Define fonts
    final PdfFont titleFont = PdfStandardFont(PdfFontFamily.helvetica, 28, style: PdfFontStyle.bold);
    final PdfFont headerFont = PdfStandardFont(PdfFontFamily.helvetica, 18, style: PdfFontStyle.bold);
    final PdfFont regularFont = PdfStandardFont(PdfFontFamily.helvetica, 12);
    final PdfFont boldFont = PdfStandardFont(PdfFontFamily.helvetica, 12, style: PdfFontStyle.bold);

    // Draw background color
    page.graphics.drawRectangle(
      bounds: Rect.fromLTWH(0, 0, pageSize.width, pageSize.height),
      brush: PdfSolidBrush(backgroundColor),
    );

    // Draw a rectangle for the header section
    page.graphics.drawRectangle(
      bounds: Rect.fromLTWH(0, 0, pageSize.width, 100),
      brush: PdfSolidBrush(primaryColor),
    );

    // Draw the invoice title
    page.graphics.drawString(
      'INVOICE',
      titleFont,
      brush: PdfBrushes.white,
      bounds: Rect.fromLTWH(30, 30, pageSize.width - 60, 40),
    );

    // Draw company information
    page.graphics.drawString(
      'Company Name\nAddress Line 1\nAddress Line 2\nCity, ZIP\nEmail: example@company.com',
      regularFont,
      bounds: Rect.fromLTWH(30, 120, pageSize.width - 60, 60),
      brush: PdfSolidBrush(secondaryColor),
    );

    // Draw invoice details
    page.graphics.drawString(
      'Invoice #: 12345\nDate: 01/01/2024\nDue Date: 15/01/2024',
      regularFont,
      bounds: Rect.fromLTWH(30, 200, pageSize.width - 60, 60),
      brush: PdfSolidBrush(secondaryColor),
    );

    // Draw recipient details
    page.graphics.drawString(
      'Bill To:\nCustomer Name\nCustomer Address Line 1\nCustomer Address Line 2\nCity, ZIP',
      regularFont,
      bounds: Rect.fromLTWH(30, 280, pageSize.width - 60, 80),
      brush: PdfSolidBrush(secondaryColor),
    );

    // Draw table headers
    page.graphics.drawString(
      'Description                   Quantity      Unit Price      Total',
      boldFont,
      bounds: Rect.fromLTWH(30, 380, pageSize.width - 60, 30),
      brush: PdfSolidBrush(secondaryColor),
    );

    // Draw a line under the headers
    page.graphics.drawLine(
      PdfPen(accentColor, width: 2),
      Offset(30, 410),
      Offset(pageSize.width - 30, 410),
    );

    // Draw the table rows
    page.graphics.drawString(
      'Product 1                         1               \$100.00        \$100.00\n'
          'Product 2                         2               \$50.00          \$100.00\n'
          'Product 3                         3               \$30.00          \$90.00',
      regularFont,
      bounds: Rect.fromLTWH(30, 420, pageSize.width - 60, 80),
      brush: PdfSolidBrush(secondaryColor),
    );

    // Draw the total amount section
    page.graphics.drawRectangle(
      bounds: Rect.fromLTWH(0, pageSize.height - 100, pageSize.width, 60),
      brush: PdfSolidBrush(accentColor),
    );

    page.graphics.drawString(
      'Total: \$290.00',
      headerFont,
      bounds: Rect.fromLTWH(30, pageSize.height - 85, pageSize.width - 60, 40),
      format: PdfStringFormat(alignment: PdfTextAlignment.right),
      brush: PdfBrushes.white,
    );

    // Save the document
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/ModernInvoice_${DateTime.now().millisecondsSinceEpoch}.pdf';

    // Save the document.
    File(path).writeAsBytes(await document.save());
    print("Pdf Saved");
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
