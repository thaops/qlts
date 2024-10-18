import 'package:get/get.dart';
import 'package:qlts_flutter/common/Services/api_endpoints.dart';
import 'package:qlts_flutter/common/constants/http_status_codes.dart';
import 'package:qlts_flutter/common/repositoty/dio_api.dart';
import 'package:qlts_flutter/features/presentation/asset_tracke/data/model/asset_tracke_respone.dart';

class AssetSearchController extends GetxController {
  var inventoryItem = <InventoryItem>[].obs;
  DioApi dioApi = DioApi();

  void onSearch(String text) async {
  
    try {
      final response = await dioApi.post(
        ApiEndpoints.assetSearch,
        data: {
          "mainInventoryCode": text,
        },
      );
      print("Response: ${response.data}"); // In ra phản hồi từ API
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
            print("Không có dữ liệu trong trường 'data'");
          }
        } else {
          print("Dữ liệu trả về không hợp lệ: ${response.data}");
        }
      }
    } catch (e) {
      print("error $e");
    }
  }
}
