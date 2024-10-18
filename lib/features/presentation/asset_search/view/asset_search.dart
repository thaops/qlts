import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlts_flutter/common/widgets/text_widget.dart';
import 'package:qlts_flutter/core/configs/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qlts_flutter/features/presentation/asset_search/controller/asset_search_controller.dart';
import 'package:qlts_flutter/features/presentation/asset_search/widget/search_field.dart';
import 'package:qlts_flutter/features/presentation/asset_tracke/widget/inventory_item_widget.dart'; // Đảm bảo import đúng

class AssetSearch extends StatelessWidget {
  const AssetSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final AssetSearchController controllerAssetSearch = Get.find();
    final TextEditingController searchController = TextEditingController();
    Timer? _debounce;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          SizedBox(height: 30.h),
          Container(
            child: Row(
              children: [
                Expanded(
                  child: SearchField(
                    controller: searchController,
                    onChanged: (value) {
                      if (_debounce?.isActive ?? false) _debounce!.cancel();

                      // Tạo timer mới
                      _debounce = Timer(const Duration(seconds: 3), () {
                        controllerAssetSearch
                            .onSearch(value); // Gọi onSearch sau 3 giây
                      });
                    },
                  ),
                ),
                TextButton(
                  onPressed: () {
                    controllerAssetSearch.onSearch(searchController.text);
                  },
                  child: Text("Tìm Kiếm"),
                ),
              ],
            ),
          ),
          // Sử dụng Expanded để cho ListView chiếm không gian còn lại
          Expanded(
            child: Container(
              color: AppColors.white,
              child: Obx(() => ListView.builder(
                    itemCount: controllerAssetSearch.inventoryItem.length,
                    itemBuilder: (context, index) {
                      final item = controllerAssetSearch.inventoryItem[index];
                      return InventoryItemWidget(
                        item: item,
                      );
                    },
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
