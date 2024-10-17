import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qlts_flutter/core/configs/theme/app_colors.dart';
import 'package:qlts_flutter/features/presentation/qr_code/controller/qr_code_controller.dart';
import 'package:qlts_flutter/features/presentation/qr_code/widget/app_bar_qr.dart';

class QrCode extends StatefulWidget {
  const QrCode({super.key});

  @override
  _QrCodeState createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> with WidgetsBindingObserver {
  final QRCodeController qrCodeController = Get.find<QRCodeController>();
  late MobileScannerController controller; // Sử dụng late để khởi tạo sau
  bool isFlashOn = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    controller = qrCodeController.controller; // Sử dụng controller từ QRCodeController
    controller.start(); // Khởi động camera ngay khi khởi tạo
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    controller.stop(); // Dừng camera khi không còn sử dụng
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      controller.start(); // Khởi động lại camera khi ứng dụng được phục hồi
    } else if (state == AppLifecycleState.paused) {
      controller.stop(); // Dừng camera khi ứng dụng bị tạm dừng
    }
  }

  void toggleFlash() {
    setState(() {
      isFlashOn = !isFlashOn; // Đảo ngược trạng thái flash
      controller.toggleTorch(); // Bật/tắt đèn flash
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarQr(
        isFlashOn: isFlashOn,
        toggleFlash: toggleFlash,
        title: "QR Code Scanner",
        onBackPressed: () {
          Get.back();
        },
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primary, AppColors.white], // Thay đổi màu nền
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column( // Sử dụng Column để chứa các widget con
          children: [
            Expanded( // Đặt MobileScanner bên trong Expanded
              child: MobileScanner(
                fit: BoxFit.cover,
                controller: controller,
                onDetect: (capture) {
                  qrCodeController.qr_code_controller(capture, context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
