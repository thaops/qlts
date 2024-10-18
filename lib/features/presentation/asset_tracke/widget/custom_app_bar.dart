// lib/features/presentation/asset_tracke/view/custom_app_bar.dart
import 'package:flutter/material.dart';
import 'package:qlts_flutter/common/widgets/text_widget.dart';
import 'package:qlts_flutter/core/configs/theme/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function() onSearch;
  const CustomAppBar({Key? key, required this.title, required this.onSearch}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return AppBar(
      title: TextWidget(
        text: title,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.black,
      
      ),
      centerTitle: true,
      backgroundColor: AppColors.white,
      actions: [
        IconButton(
          padding: EdgeInsets.only(right: 10),
          icon: const Icon(Icons.search,
              color: AppColors.primary, size: 24), // Biểu tượng màu trắng
          onPressed: () {
            onSearch();
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
