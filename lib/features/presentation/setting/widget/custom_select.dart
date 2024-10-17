import 'package:flutter/material.dart';
import 'package:qlts_flutter/common/widgets/text_widget.dart';
import 'package:qlts_flutter/core/configs/theme/app_colors.dart';

class CustomSelect extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function()? onTap;
  final IconData? trailing;
  final Color? color;
  const CustomSelect(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap,
      this.trailing,
      this.color});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, size: 24, color: color ?? AppColors.colorIcon),
      title: TextWidget(
        text: title,
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: color ?? AppColors.black,
      ),
      trailing: trailing != null
          ? Icon(trailing, size: 24, color: AppColors.colorIcon)
          : null,
    );
  }
}
