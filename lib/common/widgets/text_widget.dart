import 'package:flutter/material.dart';
import 'package:qlts_flutter/core/configs/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  const TextWidget(
      {super.key,
      required this.text,
      this.fontSize = 24,
      this.fontWeight = FontWeight.w600,
      this.color = AppColors.yellow,
      this.textAlign = TextAlign.left,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
        color: color,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
