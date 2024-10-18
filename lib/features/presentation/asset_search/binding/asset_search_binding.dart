import 'package:get/get.dart';
import 'package:qlts_flutter/features/presentation/asset_search/controller/asset_search_controller.dart';

class AssetSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AssetSearchController());
  }
}
