import 'package:dio/dio.dart';
import 'package:qlts_flutter/common/Services/api_endpoints.dart';
import 'package:qlts_flutter/common/constants/http_status_codes.dart';
import 'package:qlts_flutter/features/presentation/asset_tracke/data/model/asset_tracke_respone.dart';

class AssetTrackerRepository {
  final Dio dio = Dio();

  Future<AssetTrackerResponse> getAssetTracker(String accessToken, int page, int pageSize) async {
    final response = await dio.get(
      ApiEndpoints.assetTracker,
      queryParameters: {
        'page': page,
        'pageSize': pageSize,
      },
      options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
    );

    if (response.statusCode == HttpStatusCodes.STATUS_CODE_OK) {
      return AssetTrackerResponse.fromJson(response.data);
    } else {
      throw Exception('Failed to load asset tracker: ${response.statusCode}');
    }
  }
}
