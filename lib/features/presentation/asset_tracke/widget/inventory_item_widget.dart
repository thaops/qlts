import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import thư viện intl
import 'package:qlts_flutter/common/widgets/text_widget.dart';
import 'package:qlts_flutter/core/configs/theme/app_colors.dart';
import 'package:qlts_flutter/features/presentation/asset_tracke/data/model/asset_tracke_respone.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InventoryItemWidget extends StatelessWidget {
  final InventoryItem item;
  final Function(String) onItemTap; // Thay đổi kiểu callback thành String
  const InventoryItemWidget({Key? key, required this.item, required this.onItemTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var avatarUrlSmall =
        "https://png.pngtree.com/png-vector/20190330/ourmid/pngtree-jpg-file-document-icon-png-image_897364.jpg";

    // Định dạng ngày tháng năm
    String formattedDate = '';
    if (item.usageDate != null && item.usageDate!.isNotEmpty) {
      try {
        DateFormat inputFormat = DateFormat('MM/dd/yyyy'); // Định dạng đầu vào
        DateTime dateTime = inputFormat.parse(item.usageDate!); // Phân tích chuỗi thành DateTime
        formattedDate = DateFormat('dd/MM/yyyy').format(dateTime); // Định dạng ngày
      } catch (e) {
        print("Error parsing date: $e"); // In ra lỗi nếu có
        formattedDate = item.usageDate!; // Nếu không thể phân tích, giữ nguyên chuỗi
      }
    } else {
      formattedDate = 'N/A'; // Hoặc một thông báo mặc định khác
    }

    return GestureDetector( // Thêm GestureDetector để xử lý sự kiện nhấn
      onTap: () => onItemTap(item.mainInventoryId), // Sử dụng trực tiếp chuỗi
      child: Container(
        color: AppColors.white,
        padding: EdgeInsets.all(24.0.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Hình ảnh với xử lý lỗi
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Image.network(
                item.avatarUrlSmall ?? avatarUrlSmall,
                width: 100.w, // Kích thước hình ảnh
                height: 100.h,
                fit: BoxFit.cover,
                errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                  return Container(
                    width: 100.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                      color: AppColors.grey, // Màu nền khi có lỗi
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Icon(Icons.error, color: AppColors.white), // Biểu tượng lỗi
                  );
                },
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(
                    text: "${item.mainInventoryCode} - ${item.mainInventoryName}",
                    fontSize: 16,
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                    maxLines: 2,
                  ),
                  5.verticalSpace,
                  Row(
                    children: [
                      TextWidget(
                        text: formattedDate.toString(),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: AppColors.grey,
                      ),
                      10.horizontalSpace, // Khoảng cách nhỏ hơn giữa các widget
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                          decoration: BoxDecoration(
                            color: AppColors.colorRedBackground,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: TextWidget(
                            text: "Sắp bảo trì",
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: AppColors.colorRed,
                          ),
                        ),
                      ),
                    ],
                  ),
                  5.verticalSpace,
                  TextWidget(
                    text: item.location, // Hiển thị vị trí
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: AppColors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
