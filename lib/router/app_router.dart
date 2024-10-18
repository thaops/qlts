// lib/router.dart
import 'package:get/get.dart';
import 'package:qlts_flutter/bindings/bottom_binding.dart';
import 'package:qlts_flutter/features/auth/user_login/binding/login_binding.dart';
import 'package:qlts_flutter/features/auth/user_login/view/user_login.dart';
import 'package:qlts_flutter/features/presentation/asset_details/binding/asset_detail_binding.dart';
import 'package:qlts_flutter/features/presentation/asset_search/binding/asset_search_binding.dart';
import 'package:qlts_flutter/features/presentation/asset_tracke/binding/asset_reacke_binding.dart';
import 'package:qlts_flutter/features/presentation/asset_tracke/view/asset_tracker.dart';
import 'package:qlts_flutter/features/presentation/qr_code/binding/qr_code_binding.dart';
import 'package:qlts_flutter/features/presentation/setting/view/setting.dart';
import 'package:qlts_flutter/features/presentation/qr_code/view/qr_code.dart';
import 'package:qlts_flutter/router/bottom_navigation_bar.dart';
import 'package:qlts_flutter/features/presentation/asset_details/view/aseet_detail.dart';
import 'package:qlts_flutter/features/presentation/asset_search/view/asset_search.dart';
class AppRoutes {
  static const String auth = '/auth';
  static const String assetTracker = '/asset_tracker';
  static const String repairHistory = '/repair_history';
  static const String qrCode = '/qr_code';
  static const String assetSearch = '/asset_search';
  static const String bottomNavBar = '/bottom_nav_bar';
  static const String assetDetail = '/asset_detail';
  static List<GetPage> routes = [
    GetPage(name: auth, page: () => UserLogin(),binding: LoginBinding()),
    GetPage(name: assetTracker, page: () => AssetTracker(),binding: AssetTrackerBinding()),
    GetPage(name: repairHistory, page: () => Setting()),
    GetPage(name: qrCode, page: () => QrCode(),binding: QRCodeBinding()),
    GetPage(name: bottomNavBar, page: () => BottomNavBarPage(),binding: BottomNavBarBinding()),
    GetPage(name: assetDetail, page: () => AssetDetail(),binding: AssetDetailBinding()),
    GetPage(name: assetSearch, page: () => AssetSearch(),binding: AssetSearchBinding()),
  ];
}