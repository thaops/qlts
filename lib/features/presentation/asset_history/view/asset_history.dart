import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlts_flutter/common/img/img.dart';
import 'package:qlts_flutter/common/widgets/text_widget.dart';
import 'package:qlts_flutter/core/configs/theme/app_colors.dart';
import 'package:qlts_flutter/features/presentation/asset_history/controller/asset_history_controller.dart';
import 'package:qlts_flutter/features/presentation/asset_history/widget/custom_list_history.dart';
import 'package:qlts_flutter/features/presentation/asset_history/widget/text_row.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AssetHistory extends StatelessWidget {
  final String assetType;
  final String assetLocation;
  final String mainInventoryId;
  const AssetHistory(
      {super.key, required this.assetType, required this.assetLocation, required this.mainInventoryId});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AssetHistoryController());
   
    controller.fetchRepairHistory(mainInventoryId);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            10.verticalSpace,
            TextRow(
              title: "Loại tài sản",
              content: assetType,
              titleFontWeight: FontWeight.w300,
              contentFontWeight: FontWeight.w400,
              titleColor: AppColors.darkGrey,
              contentColor: AppColors.black,
            ),
            10.verticalSpace,
            TextRow(
              title: "Địa điểm",
              content: assetLocation,
              titleFontWeight: FontWeight.w300,
              contentFontWeight: FontWeight.w400,
              titleColor: AppColors.darkGrey,
              contentColor: AppColors.black,
            ),
            Expanded(
              child: Obx(() {
                if (controller.repairHistory == null || controller.repairHistory.isEmpty) {
                  return Center(
                    child: Image.asset(Img.errorImage), // Thay đổi đường dẫn đến hình ảnh của bạn
                  );
                }
                return ListView.builder(
                  itemCount: controller.repairHistory.length,
                  padding: EdgeInsets.only(top: 20.r),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CustomListHistory(
                            repairHistory: controller.repairHistory[index]),
                        if (index <
                            controller.repairHistory.length - 1) // Kiểm tra để không thêm SizedBox sau phần tử cuối
                          SizedBox(
                              height: 16.r), // Khoảng cách giữa các phần tử
                      ],
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
