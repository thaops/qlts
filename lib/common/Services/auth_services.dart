// lib/controllers/auth_controller.dart

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:qlts_flutter/common/Services/services.dart';

class AuthServices extends GetxController {
  var accessToken = ''.obs; // Sử dụng Rx để theo dõi sự thay đổi của accessToken

  @override
  void onInit() {
    super.onInit();
    fetchAccessToken(); // Gọi fetchAccessToken khi controller được khởi tạo
  }

  Future<void> fetchAccessToken() async {
    // Lấy accessToken từ SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('accessToken'); // Lấy accessToken từ SharedPreferences
    if (token != null) {
      accessToken.value = token; // Cập nhật giá trị accessToken
    } else {
      // Nếu không có token, có thể gọi lại dịch vụ để lấy token mới
      Services services = await Services.create();
      token = await services.getAccessToken(); // Lấy accessToken
      accessToken.value = token; // Cập nhật giá trị accessToken
      // Lưu accessToken vào SharedPreferences
      await prefs.setString('accessToken', token);
    }
  }

  void setAccessToken(String token) {
    accessToken.value = token; // Cập nhật giá trị accessToken
    // Lưu accessToken vào SharedPreferences
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString('accessToken', token);
    });
  }

  void logout() async {
    accessToken.value = ''; // Đặt accessToken về rỗng
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('accessToken'); // Xóa accessToken khỏi SharedPreferences
  }
}