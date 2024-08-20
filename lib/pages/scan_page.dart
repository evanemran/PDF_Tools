import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_document_scanner/flutter_document_scanner.dart';
import 'package:pdf_maker/tools/app_tools.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  final _controller = DocumentScannerController();

  @override
  Widget build(BuildContext context) {
    _controller.statusTakePhotoPage.listen((AppStatus event) {
      print("Changes when taking the picture");
      print("[initial, loading, success, failure]");
    });

    _controller.statusCropPhoto.listen((AppStatus event) {
      print("Changes while cutting the image and adding warp perspective");
      print("[initial, loading, success, failure]");
    });

    _controller.statusEditPhoto.listen((AppStatus event) {
      print("Changes when editing the image (applying filters)");
      print("[initial, loading, success, failure]");
    });

    _controller.currentFilterType.listen((FilterType event) {
      print("Listen to the current filter applied on the image");
      print("[ natural, gray, eco]");
    });

    _controller.statusSavePhotoDocument.listen((AppStatus event) {
      print("Changes while the document image is being saved");
      print("[initial, loading, success, failure]");

      AppTools.showToast(event.name);
    });

    _controller.currentPage.listen((AppPages page) {
      print("Changes in the current page");
      print("[takePhoto, cropPhoto, editDocument]");
    });

    return Scaffold(
      body: DocumentScanner(
        controller: _controller,
        onSave: (Uint8List imageBytes) {
          print("image bytes: $imageBytes");
        },
        pageTransitionBuilder: (child, animation) {
          final tween = Tween(begin: 0.0, end: 1.0);

          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutCubic,
          );

          return FadeTransition(
            opacity: tween.animate(curvedAnimation),
            child: child,
          );
        },
        resolutionCamera: ResolutionPreset.high,
        initialCameraLensDirection: CameraLensDirection.back,
      ),
    );
  }
}
