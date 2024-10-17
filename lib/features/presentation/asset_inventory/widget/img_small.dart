import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlts_flutter/core/configs/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
  
class ImgSmall extends StatelessWidget {
  final String avatarUrl;
  const ImgSmall({super.key, required this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Image.network(
              avatarUrl,
              width: Get.width, // Kích thước hình ảnh
              height: 200.h,
              fit: BoxFit.cover,
              errorBuilder:
                  (BuildContext context, Object error, StackTrace? stackTrace) {
                return Container(
                  width: Get.width,
                  height: 200.h,
                  decoration: BoxDecoration(
                    color: AppColors.grey, // Màu nền khi có lỗi
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(Icons.error,
                      color: AppColors.white, size: 40.r), // Biểu tượng lỗi
                );
              },
      ),
    );
  }
}
