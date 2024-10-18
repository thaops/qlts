import 'package:flutter/material.dart';
import 'package:qlts_flutter/common/widgets/text_widget.dart';
import 'package:qlts_flutter/core/configs/theme/app_colors.dart';

class AppBarQr extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isFlashOn;
  final VoidCallback toggleFlash;
  final VoidCallback onBackPressed; // Thêm callback cho nút quay lại
  
  

  const AppBarQr({
    Key? key,
    required this.title,
    required this.isFlashOn,
    required this.toggleFlash,
    required this.onBackPressed, // Nhận callback từ widget cha
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back,
            color: AppColors.white), // Biểu tượng quay lại
        onPressed: onBackPressed, // Gọi hàm quay lại khi nhấn nút
      ),
      title: TextWidget(
        text: title,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      ),
      backgroundColor: AppColors.primary,
      actions: [
        AnimatedOpacity(
          opacity: isFlashOn ? 1.0 : 0.5,
          duration: const Duration(milliseconds: 300),
          child: IconButton(
            icon: Icon(
              isFlashOn ? Icons.flash_on : Icons.flash_off,
              color: AppColors.white,
            ),
            onPressed: toggleFlash,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.image,
              color: Colors.white), // Biểu tượng màu trắng
          onPressed: () {
            // Hành động khi nhấn nút QR code scanner
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
