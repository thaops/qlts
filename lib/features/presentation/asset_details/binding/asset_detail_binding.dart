import 'package:get/get.dart';
import 'package:qlts_flutter/features/presentation/asset_inventory/controller/asset_detail_controller.dart';

class AssetDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AssetDetailController());
  }
}