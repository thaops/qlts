import 'package:flutter/material.dart';
import 'package:qlts_flutter/core/configs/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color? color;
  final Color? textColor;
  final bool isOutlined;

  const CustomButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.color,
    this.textColor,
    this.isOutlined = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // Sử dụng Expanded để chiếm hết chiều dài
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: isOutlined ? Colors.transparent : color,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: isOutlined ? Colors.black : AppColors.primary),
        ),
        child: TextButton(
          onPressed: () {
            onPressed?.call();
          },
          child: Text(
            text,
            style: TextStyle(color: textColor ?? Colors.white),
          ),
        ),
      ),
    );
  }
}
