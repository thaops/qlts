import 'package:get/get.dart';
import 'package:qlts_flutter/features/presentation/qr_code/controller/qr_code_controller.dart';

class QRCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QRCodeController());
  }
}
