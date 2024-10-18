import 'package:get/get.dart';
import 'package:qlts_flutter/common/Services/api_endpoints.dart';
import 'package:qlts_flutter/common/constants/http_status_codes.dart';
import 'package:qlts_flutter/common/repositoty/dio_api.dart';
import 'package:qlts_flutter/features/presentation/asset_history/data/model/repair_history.dart';

class AssetHistoryController extends GetxController {
  var repairHistory = <RepairHistory>[].obs;
  DioApi dioApi = DioApi();

  void fetchRepairHistory(String mainInventoryId) async {
    try {
      final response = await dioApi.post(
        ApiEndpoints.assetHistory,
        data: {
          "mainInventoryId": mainInventoryId,
        },
      );
      if (response.statusCode == HttpStatusCodes.STATUS_CODE_OK) {
        if (response.data is Map) {
          var assetData = response.data['data'];
          if (assetData != null && assetData is List) {
            List<RepairHistory> repairHistoryList = assetData.map((item) => RepairHistory.fromJson(item)).toList();
            repairHistory.assignAll(repairHistoryList); // Thêm tất cả vào danh sách repairHistory
            
          
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
