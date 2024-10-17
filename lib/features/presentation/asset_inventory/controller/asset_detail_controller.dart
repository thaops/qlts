import 'package:get/get.dart';
import 'package:qlts_flutter/common/Services/api_endpoints.dart';
import 'package:qlts_flutter/common/constants/http_status_codes.dart';
import 'package:qlts_flutter/common/repositoty/dio_api.dart';
import 'package:qlts_flutter/features/presentation/asset_tracke/data/model/asset_tracke_respone.dart';

class AssetDetailController extends GetxController {
    var inventoryItem = <InventoryItem>[].obs;


DioApi dioApi = DioApi();
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchAssetDetail(Get.arguments);
  }

  void fetchAssetDetail(String mainInventoryId) async {
    try {
      final response = await dioApi.post(
        ApiEndpoints.assetDetail,
        data: {
          "mainInventoryId": mainInventoryId,
        },
      );
      if (response.statusCode == HttpStatusCodes.STATUS_CODE_OK) {
        // Kiểm tra xem response.data có phải là Map không
        if (response.data is Map) {
          // Trích xuất dữ liệu từ trường 'data'
          var assetData = response.data['data'];
          if (assetData != null) {
            // Chuyển đổi assetData thành InventoryItem
            InventoryItem item = InventoryItem.fromJson(assetData);
            inventoryItem.add(item); // Thêm vào danh sách inventoryItem
          } else {
            print("Không có dữ liệu trong trường 'data'");
          }
        } else {
          print("Dữ liệu trả về không hợp lệ: ${response.data}");
        }
      }
    } catch (e) {
      print("error: $e");
    }
  }

}
