import 'package:flutter/material.dart';
import 'package:qlts_flutter/common/widgets/text_widget.dart';
import 'package:qlts_flutter/core/configs/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLisst extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;
  final Function() onTap;
  const CustomLisst(
      {super.key,
      required this.title,
      required this.content,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.grey, width: 1.w),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColors.yellow,
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextWidget(
                    text: title,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey,
                  ),
                  SizedBox(height: 5.h),
                  TextWidget(
                    text: content,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
