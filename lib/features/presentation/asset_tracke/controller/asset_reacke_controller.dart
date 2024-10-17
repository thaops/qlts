import 'package:get/get.dart';
import 'package:qlts_flutter/common/Services/services.dart';
import 'package:qlts_flutter/common/constants/http_status_codes.dart';
import 'package:qlts_flutter/features/presentation/asset_tracke/data/model/asset_tracke_respone.dart';
import 'package:qlts_flutter/features/presentation/asset_tracke/data/repository/aseet_tracke_rep.dart';
import 'package:qlts_flutter/router/app_router.dart';

class AssetTrackerController extends GetxController {
  var inventoryItemList = <InventoryItem>[].obs;
  bool isLoading = true; // Biến để theo dõi trạng thái tải
  int currentPage = 1; // Trang hiện tại
  final int pageSize = 20; // Số lượng item mỗi trang
  AssetTrackerRepository assetTrackerRepository = AssetTrackerRepository();

  @override
  void onInit() {
    super.onInit();
    fetchInventoryItems();
  }

  void onItemTap(String inventoryId) {
    Get.toNamed(AppRoutes.assetDetail, arguments: inventoryId); // Truyền ID tài sản
  }

  Future<void> fetchInventoryItems() async {
    final services = await Services.create();
    final accessToken = await services.getAccessToken();
    try {
      isLoading = true; // Bắt đầu tải
      update(); // Cập nhật trạng thái
      final response = await assetTrackerRepository.getAssetTracker(accessToken, currentPage, pageSize);
      if(response.statusCode == HttpStatusCodes.STATUS_CODE_OK){
        inventoryItemList.addAll(response.data); // Thêm dữ liệu vào danh sách
      }
    } catch (e) {
      print("error $e");
    } finally {
      isLoading = false; // Kết thúc tải
      update(); // Cập nhật trạng thái
    }
  }

  // Phương thức để tải thêm dữ liệu
  Future<void> loadMoreItems() async {
    currentPage++; // Tăng trang hiện tại
    await fetchInventoryItems(); // Gọi lại phương thức fetchInventoryItems để tải thêm dữ liệu
  }
}
