import 'package:get/get.dart';

class SnackbarHelper {
  void showSnackbar(String title, String message,
      {Duration duration = const Duration(seconds: 2)}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      duration: duration, // Sử dụng tham số duration
    );
  }
}
