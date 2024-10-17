import 'package:flutter/material.dart';
import 'package:qlts_flutter/core/configs/theme/app_colors.dart';

class ButtonAth extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color color;
  const ButtonAth({super.key, required this.text, required this.onPressed, this.color = AppColors.primary});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          onPressed();
        },
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ), 
        ),
      ),
    );
  }
}
