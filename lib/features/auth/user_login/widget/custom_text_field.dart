import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qlts_flutter/core/configs/theme/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  final bool obscureText; // Trạng thái ẩn/hiện mật khẩu
  final IconData? suffixIcon; // Icon hiển thị bên phải

  CustomTextField({
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon, // Thêm thuộc tính suffixIcon
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText; // Trạng thái ẩn/hiện mật khẩu

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText; // Khởi tạo trạng thái
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText; // Đảo ngược trạng thái
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        Container(
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: AppColors.colorIcon),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: widget.controller,
            style: const TextStyle(color: AppColors.black),
            textAlignVertical: TextAlignVertical.center, // Căn giữa văn bản

            obscureText: _obscureText,

            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              hintText: widget.hintText,
              border: InputBorder.none,
              suffixIcon: widget.suffixIcon != null
                  ? IconButton(
                      icon: Icon(
                        _obscureText ? widget.suffixIcon : Icons.visibility,
                        size: 24,
                      ),
                      color: AppColors.colorIcon,
                      onPressed:
                          _togglePasswordVisibility, // Gọi hàm khi nhấn vào icon
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
