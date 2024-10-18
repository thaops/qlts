import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlts_flutter/features/presentation/asset_details/widget/app_bar_deatial.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qlts_flutter/features/presentation/asset_history/view/asset_history.dart';
import 'package:qlts_flutter/features/presentation/asset_inventory/controller/asset_detail_controller.dart';
import 'package:qlts_flutter/features/presentation/asset_inventory/view/asset_inventory.dart';

class AssetDetail extends StatelessWidget {
  const AssetDetail({super.key});

  @override
  Widget build(BuildContext context) {
    // Nhận tham số từ Get.arguments
    final String assetId = Get.arguments;
    AssetDetailController controller = Get.put(AssetDetailController());
    controller.fetchAssetDetail(assetId);

    return DefaultTabController(
      length: 2, // Số lượng tab
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(125.h),
          child: Obx(() {
            if (controller.inventoryItem.isNotEmpty) {
              var inventoryItem = controller.inventoryItem.value[0];
              String mainInventoryCode = inventoryItem.mainInventoryCode;
              String mainInventoryName = inventoryItem.mainInventoryName;

              return AppBarDetail(
                mainInventoryCode: mainInventoryCode,
                mainInventoryName: mainInventoryName,
              );
            } else {
              return AppBarDetail(
                mainInventoryCode: 'Loading...',
                mainInventoryName: '',
              );
            }
          }),
        ),
        body: Obx(() {
          if (controller.inventoryItem.isNotEmpty) {
            return TabBarView(
              children: [
                AssetInventory(assetId: assetId), // Nội dung cho tab Chi tiết
                AssetHistory(
                    assetType:
                        controller.inventoryItem.value[0].mainInventoryType,
                    assetLocation: controller.inventoryItem.value[0].location,
                    mainInventoryId: assetId)
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }),
      ),
    );
  }
}
