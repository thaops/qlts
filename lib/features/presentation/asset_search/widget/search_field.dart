import 'package:flutter/material.dart';
import 'package:qlts_flutter/core/configs/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchField extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onChanged; // Thêm hàm callback

  const SearchField(
      {Key? key, required this.controller, required this.onChanged})
      : super(key: key);

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0.r),
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          hintText: 'Nhập từ khóa tìm kiếm',
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.primary,
          ),
          suffixIcon: widget.controller.text.isNotEmpty
              ? IconButton(
                  icon: Icon(Icons.close, color: AppColors.colorIcon),
                  onPressed: () {
                    widget.controller.clear();
                    widget.onChanged(''); // Gọi hàm callback khi xóa
                    setState(() {}); // Cập nhật trạng thái để hiển thị lại
                  },
                )
              : null, // Chỉ hiển thị icon khi controller có dữ liệu
          fillColor: AppColors.grey.withOpacity(0.1),
          filled: true,
          contentPadding:
              EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
        ),
        style: TextStyle(color: AppColors.colorIcon),
        onChanged: (value) {
          widget.onChanged(value); // Gọi hàm callback khi có thay đổi
          setState(() {}); // Cập nhật trạng thái để hiển thị lại
        },
      ),
    );
  }
}
