import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlts_flutter/common/utils/date_utils.dart';
import 'package:qlts_flutter/features/presentation/asset_inventory/controller/asset_detail_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qlts_flutter/features/presentation/asset_inventory/widget/custom_lisst.dart';
import 'package:qlts_flutter/features/presentation/asset_inventory/widget/img_small.dart';

class AssetInventory extends StatelessWidget {
  final String assetId;

  const AssetInventory({super.key, required this.assetId});

  @override
  Widget build(BuildContext context) {
    AssetDetailController controller = Get.put(AssetDetailController());
    controller.fetchAssetDetail(assetId);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Obx(() {
          if (controller.inventoryItem.isEmpty) {
            return Center(child: CircularProgressIndicator()); // Hiển thị loading nếu chưa có dữ liệu
          }

          // Lấy thông tin từ inventoryItem
          var inventoryItem = controller.inventoryItem.value[0];
          String usageDate = DateUtilsCustom.formatDate(inventoryItem.usageDate);
          String warrantyDate = DateUtilsCustom.formatDate(inventoryItem.warrantyDate);
          String avatarUrl = inventoryItem.avatarUrlSmall ?? '';
          String prices = inventoryItem.prices.isNotEmpty ? inventoryItem.prices.toString() : '----------';
          String mainInventoryType = inventoryItem.mainInventoryType.isNotEmpty ? inventoryItem.mainInventoryName : '----------';
          String sector = inventoryItem.sector ?? '----------';
          String location = inventoryItem.location ?? '----------';

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              ImgSmall(avatarUrl: avatarUrl), // Hiển thị hình ảnh
              SizedBox(height: 20.h),
              _buildInfoRow("Ngày sử dụng", usageDate, Icons.calendar_month, "Nguyên giá", prices, Icons.money),
              SizedBox(height: 16.h),
              _buildInfoRow("Loại tài sản", mainInventoryType, Icons.list, "Bảo hành", warrantyDate, Icons.settings_input_hdmi),
              SizedBox(height: 16.h),
              CustomLisst(title: "Khu vực", content: sector, icon: Icons.map, onTap: () {}),
              SizedBox(height: 16.h),
              CustomLisst(title: "Địa điểm", content: location, icon: Icons.location_on, onTap: () {}),
            ],
          );
        }),
      ),
    );
  }

  // Hàm xây dựng hàng thông tin
  Widget _buildInfoRow(String title1, String content1, IconData icon1, String title2, String content2, IconData icon2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CustomLisst(
            title: title1,
            content: content1,
            icon: icon1,
            onTap: () {},
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: CustomLisst(
            title: title2,
            content: content2,
            icon: icon2,
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
