import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRCodeController extends GetxController {
  String? scannedCode;
  final MobileScannerController controller = MobileScannerController(
    detectionSpeed: DetectionSpeed.normal,
    returnImage: true,
  );

  bool isFlashOn = false;
  bool hasScanned = false;



  void qr_code_controller(BarcodeCapture capture, BuildContext context) {
    if (hasScanned) return; // Nếu đã quét, không làm gì cả

    final List<Barcode> barcodes = capture.barcodes;
    final Uint8List? image = capture.image;

    if (barcodes.isNotEmpty) {
      final String code = barcodes.first.rawValue ?? 'Unknown';
      print('QR Code: $code');

      // Đánh dấu là đã quét
      hasScanned = true;

      // Dừng camera sau khi quét thành công
      controller.stop();

      // Hiển thị mã đã quét
      _showScannedDialog(code, image, context);
    }
  }

  void _showScannedDialog(String code, Uint8List? image, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: image != null ? Image(image: MemoryImage(image)) : null,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Đóng dialog
                controller.start(); // Khởi động lại camera
                hasScanned = false; // Đặt lại trạng thái quét
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
