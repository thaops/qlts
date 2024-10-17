import 'package:get/get.dart';
import 'package:qlts_flutter/features/presentation/asset_tracke/controller/asset_reacke_controller.dart';
import 'package:qlts_flutter/features/presentation/setting/controller/setting_controller.dart';

class BottomNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AssetTrackerController>(() => AssetTrackerController());
    Get.lazyPut<SettingController>(() => SettingController(Get.find()));
  }
}