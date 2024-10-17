import 'package:get/get.dart';
import 'package:qlts_flutter/features/presentation/asset_tracke/controller/asset_reacke_controller.dart';

class AssetTrackerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AssetTrackerController>(() => AssetTrackerController());
  }
}
