import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qlts_flutter/common/widgets/text_widget.dart';
import 'package:qlts_flutter/core/configs/theme/app_colors.dart';
import 'package:qlts_flutter/features/presentation/setting/controller/setting_controller.dart';
import 'package:qlts_flutter/features/presentation/setting/widget/custom_select.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingController controller = Get.put(SettingController(Get.find()));
    String avatar =
        "https://i.pinimg.com/736x/97/3c/fc/973cfcca079333c9657855db38bdc79f.jpg";
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/logo/background_profile.png'), // Đường dẫn đến hình ảnh nền
            fit: BoxFit.fill, // Đảm bảo hình ảnh phủ kín toàn bộ
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(0.w),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24.w),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Căn giữa theo chiều dọc
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Căn giữa theo chiều ngang
              children: [
                SizedBox(height: 30.h),
                TextWidget(
                    text: "Cài đặt",
                    fontSize: 20.sp,
                    color: AppColors.black,
                    fontWeight: FontWeight.w600),
                SizedBox(height: 20.h),
                ClipOval(
                  // Sử dụng ClipOval để tạo hình tròn
                  child: Image.network(
                    avatar, // Đường dẫn đến hình ảnh
                    height: 120.h,
                    width: 120.w,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 30.h),
                TextWidget(
                    text: "Admin",
                    fontSize: 20.sp,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600),
                20.verticalSpace,
                CustomSelect(
                  title: "Version 1.0.1",
                  icon: Icons.info,
                  onTap: () {},
                ),
                10.verticalSpace,
                Container(
                  height: 1.h,
                  width: double.infinity,
                  color: AppColors.grey,
                ),
                10.verticalSpace,
                CustomSelect(
                  title: "Đăng xuất",
                  icon: Icons.logout,
                  onTap: () => controller.signOut(),
                  trailing: Icons.arrow_forward_ios,
                  color: AppColors.colorRed,
                ),
                // Thêm các widget khác nếu cần
              ],
            ),
          ),
        ),
      ),
    );
  }
}
