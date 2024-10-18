import 'package:flutter/material.dart';
import 'package:qlts_flutter/common/utils/date_utils.dart';
import 'package:qlts_flutter/common/widgets/text_widget.dart';
import 'package:qlts_flutter/core/configs/theme/app_colors.dart';
import 'package:qlts_flutter/features/presentation/asset_history/data/model/repair_history.dart';
import 'package:qlts_flutter/features/presentation/asset_history/widget/text_row.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListHistory extends StatelessWidget {
  final RepairHistory repairHistory;
  const CustomListHistory({super.key, required this.repairHistory});

  @override
  Widget build(BuildContext context) {
    // Chuyển đổi repairDate thành chuỗi theo định dạng 'yyyy-MM-dd' trước khi phân tích
    String repairDate = DateUtilsCustom.formatStringDate(
        repairHistory.repairDate.toIso8601String());
    String completeDate = DateUtilsCustom.formatStringDate(
        repairHistory.completeDate?.toIso8601String() ??
            ''); // Updated to handle null safely
    String notTitle = "-----------------";

    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey, width: 1.w),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextRow(
            title: "Ngày",
            content: repairDate,
            titleFontWeight: FontWeight.bold,
            contentFontWeight: FontWeight.bold,
          ),
          10.verticalSpace,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: TextWidget(
              text: repairHistory.status,
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: AppColors.primary,
            ),
          ),
          10.verticalSpace,
          // Tạo một hàm để giảm thiểu mã lặp lại
          ..._buildTextRows(completeDate),
        ],
      ),
    );
  }

  List<Widget> _buildTextRows(String completeDate) {
    return [
      _createTextRow("Công việc", repairHistory.description),
      _createTextRow("Số lượng", repairHistory.quantity.toString()),
      _createTextRow("Dự tính giá", repairHistory.estimatePrice.toString()),
      _createTextRow("Nhà cung cấp", repairHistory.supplier),
      _createTextRow("Ngày hoàn thành", completeDate),
      _createTextRow("Ghi chú", "-----------------"),
    ];
  }

  Widget _createTextRow(String title, String content) {
    return Column(
      children: [
        TextRow(
          title: title,
          content: content,
          titleFontWeight: FontWeight.w400,
          titleColor: AppColors.colorIcon,
          contentFontWeight: FontWeight.w400,
          isStar: true,
        ),
        10.verticalSpace,
      ],
    );
  }
}
