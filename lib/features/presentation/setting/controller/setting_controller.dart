import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlts_flutter/common/Services/services.dart';
import 'package:qlts_flutter/common/widgets/text_widget.dart';
import 'package:qlts_flutter/core/configs/theme/app_colors.dart';
import 'package:qlts_flutter/features/presentation/setting/widget/custom_button.dart';
import 'package:qlts_flutter/router/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingController extends GetxController {
  final Services _services;

  SettingController(this._services);

  static Future<SettingController> create() async {
    final services = await Services.create();
    return SettingController(services);
  }

  Future<void> signOut() async {
    final shouldSignOut = await _showConfirmationDialog(
      'Thông báo',
      'Bạn chắn muốn đăng xuất không ?',
    );

    if (shouldSignOut == true) {
      await _services.deleteAccessToken();
      Get.offAllNamed(AppRoutes.auth);
      Get.snackbar('Thông báo', 'Đăng xuất thành công');
    }
  }

  Future<bool?> _showConfirmationDialog(String title, String content) {
    return Get.dialog<bool>(
      Dialog(
        child: Container(
          width: MediaQuery.of(Get.context!).size.width * 0.9, // 70% chiều rộng màn hình
          padding: EdgeInsets.all(20), // Padding cho nội dung
          child: Column(
            mainAxisSize: MainAxisSize.min, // Để chiều cao tự động điều chỉnh
            children: [
             20.verticalSpace,
              TextWidget(
                  text: title,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black), // Đổi màu tiêu đề thành đen
              SizedBox(height: 10), // Khoảng cách giữa tiêu đề và nội dung
              TextWidget(
                  text: content,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: AppColors.grey), // Đổi màu nội dung thành xám
              30.verticalSpace, // Khoảng cách dưới nội dung
              Row( // Sử dụng Row để chứa các nút
                children: [
                  Expanded(
                    child: CustomButton(
                      text: 'Hủy',
                      color: AppColors.primary,
                      textColor: AppColors.black,
                      onPressed: () {
                        Get.back(result: false);
                      },
                      isOutlined: true,
                    ),
                  ),
                  SizedBox(width: 10), // Khoảng cách giữa hai nút
                  Expanded(
                    child: CustomButton(
                      text: 'Có',
                      color: AppColors.primary,
                      textColor: AppColors.white,
                      onPressed: () {
                        Get.back(result: true);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }
}
