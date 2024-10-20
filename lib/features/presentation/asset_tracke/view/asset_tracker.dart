import 'package:flutter/material.dart';
import 'package:qlts_flutter/common/Services/auth_services.dart';
import 'package:qlts_flutter/common/img/img.dart';
import 'package:qlts_flutter/common/widgets/text_widget.dart';
import 'package:qlts_flutter/core/configs/theme/app_colors.dart';
import 'package:qlts_flutter/features/presentation/asset_tracke/controller/asset_reacke_controller.dart';
import 'package:qlts_flutter/features/presentation/asset_tracke/widget/custom_app_bar.dart';
import 'package:get/get.dart';
import 'package:qlts_flutter/features/presentation/asset_tracke/widget/inventory_item_widget.dart';

class AssetTracker extends StatelessWidget {
  const AssetTracker({super.key});

  @override
  Widget build(BuildContext context) {
    // Khởi tạo AuthServices
    final AuthServices authController = Get.put(AuthServices());
    // Khởi tạo AssetTrackerController
    final AssetTrackerController assetTrackerController =
        Get.put(AssetTrackerController());
    final ScrollController scrollController = ScrollController();

    // Lắng nghe sự kiện cuộn
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        assetTrackerController
            .loadMoreItems(); // Tải thêm dữ liệu khi cuộn đến cuối danh sách
      }
    });

    return Scaffold(
      appBar: CustomAppBar(title: 'Tài Sản/CCDC',onSearch: assetTrackerController.onSearch),
      backgroundColor: AppColors.white, // Đặt màu nền thành trắng
      body: Obx(() {
        if (assetTrackerController.isLoading.value && assetTrackerController.inventoryItemList.isEmpty) {
          return _buildLoadingIndicator(); // Hiển thị loading nếu đang tải và chưa có dữ liệu
        } else if (authController.accessToken.isEmpty) {
          return Center(
            child:
                TextWidget(text: "Vui lòng đăng nhập để sử dụng chức năng này"),
          );
        } else {
          return _buildInventoryList(assetTrackerController, scrollController);
        }
      }),
    );
  }

  Widget _buildLoadingIndicator() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildInventoryList(
      AssetTrackerController controller, ScrollController scrollController) {
    return Obx(() {
      // Thêm Obx để theo dõi inventoryItemList
      if (controller.inventoryItemList.isEmpty) {
        return Center(
          child: Image.asset(
              Img.errorImage), // Thay đổi đường dẫn đến hình ảnh của bạn
        );
      }
      return ListView.builder(
        controller: scrollController,
        itemCount: controller.inventoryItemList.length,
        itemBuilder: (context, index) {
          final item = controller.inventoryItemList[index];
          return InventoryItemWidget(
              item: item, onItemTap: controller.onItemTap);
        },
      );
    });
  }
}
