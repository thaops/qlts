import 'package:get/get.dart';
import 'package:qlts_flutter/common/Services/api_endpoints.dart';
import 'package:qlts_flutter/common/constants/http_status_codes.dart';
import 'package:qlts_flutter/common/repositoty/dio_api.dart';
import 'package:qlts_flutter/features/presentation/asset_tracke/data/model/asset_tracke_respone.dart';
import 'package:qlts_flutter/router/app_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AssetSearchController extends GetxController {
  var inventoryItem = <InventoryItem>[].obs;
  var searchHistory = <String>[].obs;
  DioApi dioApi = DioApi();
  var isDataValid = false.obs;


  void onItemTap(String inventoryId) {
    Get.toNamed(AppRoutes.assetDetail, arguments: inventoryId); // Truyền ID tài sản
  }

  void onSearch(String text) async {
    try {
      final response = await dioApi.post(
        ApiEndpoints.assetSearch,
        data: {
          "mainInventoryCode": text,
        },
      );
      if (response.statusCode == HttpStatusCodes.STATUS_CODE_OK) {
        if (response.data is Map) {
          var assetData = response.data['data'];
          if (assetData != null) {
            // Chuyển đổi assetData thành InventoryItem
            InventoryItem item = InventoryItem.fromJson(assetData);
            inventoryItem.clear(); // Xóa danh sách trước khi thêm mới
            inventoryItem.add(item); // Thêm vào danh sách inventoryItem
            print("Dữ liệu trả về: ${inventoryItem}"); // In ra danh sách
          } else {
            inventoryItem.clear();
            isDataValid.value = true;
            print("Không có dữ liệu trong trường 'data'");
          }
        } else {
          isDataValid.value = true;
          print("Dữ liệu trả về không hợp lệ: ${response.data}");
        }
      }
    } catch (e) {
      isDataValid.value = true;
      print("error $e");
    }
  }

  void addSearchHistory(String text) {
    if (!searchHistory.contains(text)) {
      searchHistory.add(text);
      saveSearchHistory();
    }
  }
  Future<void> saveSearchHistory() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setStringList('searchHistory', searchHistory);
  }

  Future<void> loadSearchHistory() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> history = sharedPreferences.getStringList('searchHistory') ?? [];
    if (history.isNotEmpty) {
      searchHistory.addAll(history);
    }
  }
}
