import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlts_flutter/common/widgets/text_widget.dart';
import 'package:qlts_flutter/core/configs/theme/app_colors.dart';

class AppBarDetail extends StatelessWidget {
  final String mainInventoryCode;
  final String mainInventoryName;
  const AppBarDetail({super.key, required this.mainInventoryCode, required this.mainInventoryName});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:  TextWidget(
        text: "${mainInventoryCode} - ${mainInventoryName}",
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.black,
      ),
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(
          Icons.arrow_back_ios_new_outlined,
          color: AppColors.primary,
        ),
      ),
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(48),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          child: Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              color: AppColors.lightBackground, // Màu nền cho TabBar
            ),
            child: TabBar(
              indicatorSize:
                  TabBarIndicatorSize.tab, // Kích thước của indicator
              dividerColor: Colors.transparent, // Ẩn đường chia
              indicator: BoxDecoration(
                color: AppColors.primaryOpacity, // Màu của indicator
                borderRadius: const BorderRadius.all(
                    Radius.circular(16)), // Bo tròn góc cho indicator
              ),
              labelColor: AppColors.primary, // Màu chữ cho tab đang chọn
              labelStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelColor:
                  Colors.black54, // Màu chữ cho tab không chọn
              tabs: const [
                Tab(text: 'Chi tiết'), // Tab Chi tiết
                Tab(text: 'Lịch sử sửa chữa'), // Tab Lịch sử sửa chữa
              ],
            ),
          ),
        ),
      ),
    );
  }
}
