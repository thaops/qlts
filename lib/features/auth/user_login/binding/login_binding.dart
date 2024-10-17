import 'package:get/get.dart';
import 'package:qlts_flutter/features/auth/user_login/controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
