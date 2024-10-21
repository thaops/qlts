import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlts_flutter/common/img/img.dart';
import 'package:qlts_flutter/common/utils/showSnackbar.dart';
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
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
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
                    if (!controllerAssetSearch.isDataValid.value) {
                      SnackbarHelper()
                          .showSnackbar("Thông báo", "Từ khóa không tồn tại");
                    }
                  },
                  child: TextWidget(
                    text: "Tìm Kiếm",
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
          // Sử dụng Expanded để cho ListView chiếm không gian còn lại
          Expanded(
            child: Container(
              color: AppColors.white,
              child: Obx(() {
                if (controllerAssetSearch.inventoryItem.isEmpty) {
                  return Center(
                    child: Image.asset(Img
                        .errorImage), // Thay đổi đường dẫn đến hình ảnh của bạn
                  );
                }
                return ListView.builder(
                  itemCount: controllerAssetSearch.inventoryItem.length,
                  itemBuilder: (context, index) {
                    final item = controllerAssetSearch.inventoryItem[index];
                    return InventoryItemWidget(
                      item: item,
                      onItemTap: controllerAssetSearch.onItemTap,
                    );
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
