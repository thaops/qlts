import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlts_flutter/common/constants/http_status_codes.dart';
import 'package:qlts_flutter/features/auth/user_login/data/repository/login_rep.dart';
import 'package:qlts_flutter/features/presentation/asset_tracke/controller/asset_reacke_controller.dart';
import 'package:qlts_flutter/router/bottom_navigation_bar.dart';
import 'package:qlts_flutter/common/Services/services.dart';
class LoginController extends GetxController {
  static final LoginRepository loginRepository = LoginRepository();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  var isLoading = false.obs;

  Future<void> login() async {
    String username = usernameController.text;
    String password = passwordController.text;
    Services services = await Services.create();
    if (username.isEmpty || password.isEmpty) {
      _showSnackbar('Thông báo', 'Vui lòng nhập đầy đủ thông tin đăng nhập');
      return; // Trả về nếu thông tin không đầy đủ
    }
    isLoading.value = true;
    try {
      final response = await loginRepository.login(username, password);

      if (response.statusCode != HttpStatusCodes.STATUS_CODE_OK) {
        return;
      }
     await services.saveAccessToken(response.data.accessToken);
      Get.offAll(() => BottomNavBarPage());
      _showSnackbar('Đăng nhập thành công', 'Bạn đã đăng nhập thành công');
    } catch (e) {
      _showSnackbar('Thông báo', 'Đăng nhập thất bại Sai tài khoản hoặc mật khẩu');
    } finally {
      isLoading.value = false;
    }
  }


  void _showSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void onInit() {
    super.onInit();
    // Khởi tạo AssetTrackerController
    Get.put(AssetTrackerController());
  }

  @override
  void onClose() {
    // Giải phóng tài nguyên khi controller bị hủy
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
