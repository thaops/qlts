import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlts_flutter/common/Services/api_endpoints.dart';
import 'package:qlts_flutter/common/img/img.dart';
import 'package:qlts_flutter/common/widgets/text_widget.dart';
import 'package:qlts_flutter/core/configs/theme/app_colors.dart';
import 'package:qlts_flutter/features/auth/user_login/controller/login_controller.dart';
import 'package:qlts_flutter/features/auth/user_login/widget/button_ath.dart';
import 'package:qlts_flutter/features/auth/user_login/widget/custom_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserLogin extends StatelessWidget {
  UserLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    print("UserLogin build ${ApiEndpoints.login}");
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Img.background), // Đường dẫn đến hình ảnh nền
            fit: BoxFit.cover, // Đảm bảo hình ảnh phủ kín toàn bộ
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(0.w),
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: EdgeInsets.all(24.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 52.h),
                    Image.asset(
                      Img.logo,
                      height: 42.h,
                      width: 76.w,
                      fit: BoxFit.cover,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 140.h),
                        const TextWidget(
                          text: "Quản lý tài sản",
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                        10.verticalSpace,
                        const TextWidget(
                          text: "Quản lý tài sản",
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.darkGrey,
                        ),
                        40.verticalSpace,
                        CustomTextField(
                          controller: controller.usernameController,
                          hintText: 'Tên đăng nhập',
                        ),
                        SizedBox(height: 20.h),
                        CustomTextField(
                          controller: controller.passwordController,
                          hintText: 'Mật khẩu',
                          suffixIcon: Icons.visibility_off,
                          obscureText: true,
                        ),
                        SizedBox(height: 40.h),
                        ButtonAth(
                          text: 'Đăng nhập',
                          onPressed: () async {
                            await controller.login();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Obx(() => controller.isLoading.value
                  ? Stack(
                      children: [
                        Container(
                          color: Colors.black.withOpacity(0.5), // Màu mờ
                        ),
                        Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    )
                  : SizedBox.shrink()),
            ],
          ),
        ),
      ),
    );
  }
}
