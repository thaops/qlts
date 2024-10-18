// lib/common/config/api_endpoints.dart
import 'package:qlts_flutter/common/Services/config.dart';

class ApiEndpoints {
  static const String login = "${Config.baseUrl}user/login";
  static const String assetTracker = "${Config.baseUrl}maininventory/get-list";
  static const String assetDetail = "${Config.baseUrl}maininventory/get-by-id";
  static const String assetHistory = "${Config.baseUrl}iteminventoryhistoryrepair/get-list";
  static const String assetSearch = "${Config.baseUrl}maininventory/get-by-asset-code";
}
