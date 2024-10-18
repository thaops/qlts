import 'package:flutter/material.dart';
import 'package:qlts_flutter/common/widgets/text_widget.dart';
import 'package:qlts_flutter/core/configs/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextRow extends StatelessWidget {
  final String title;
  final String content;
  final double fontSize;
  final FontWeight titleFontWeight;
  final FontWeight contentFontWeight;
  final Color titleColor;
  final Color contentColor;
  final bool isStar;
  const TextRow(
      {super.key,
      required this.title,
      required this.content,
      this.fontSize = 16,
      this.titleFontWeight = FontWeight.bold,
      this.contentFontWeight = FontWeight.normal,
      this.titleColor = AppColors.black,
      this.contentColor = AppColors.black,
      this.isStar = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        isStar
            ? Icon(Icons.star, size: 24, color: AppColors.yellow)
            : SizedBox(),
        5.horizontalSpace,
        TextWidget(
            text: "$title: ",
            color: titleColor,
            fontSize: fontSize,
            fontWeight: titleFontWeight),
        5.horizontalSpace,
        TextWidget(
            text: content,
            color: contentColor,
            fontSize: fontSize,
            fontWeight: contentFontWeight),
      ],
    );
  }
}
