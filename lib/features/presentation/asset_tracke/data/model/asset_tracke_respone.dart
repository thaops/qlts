class AssetTrackerResponse {
  final int statusCode;
  final String message;
  final int totalRecord;
  final List<InventoryItem> data;

  AssetTrackerResponse({
    required this.statusCode,
    required this.message,
    required this.totalRecord,
    required this.data,
  });

  factory AssetTrackerResponse.fromJson(Map<String, dynamic> json) {
    return AssetTrackerResponse(
      statusCode: json['statusCode'],
      message: json['message'],
      totalRecord: json['totalRecord'],
      data: List<InventoryItem>.from(
          json['data'].map((item) => InventoryItem.fromJson(item))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'message': message,
      'totalRecord': totalRecord,
      'data': List<dynamic>.from(data.map((item) => item.toJson())),
    };
  }

  @override
  String toString() {
    return 'AssetTrackerResponse(statusCode: $statusCode, message: $message, totalRecord: $totalRecord, data: $data)';
  }
}

class InventoryItem {
  final String mainInventoryId;
  final String mainInventoryCode;
  final String? parentId; // Nullable
  final String mainInventoryName;
  final String? usageDate; // Nullable
  final String prices;
  final String sector;
  final String location;
  final String mainInventoryType;
  final String? warrantyInfo; // Nullable
  final String? warrantyDate; // Nullable
  final String? avatarUrlSmall; // Nullable
  final String? avatarUrlMedium; // Nullable
  final String? avatarUrlBig; // Nullable

  InventoryItem({
    required this.mainInventoryId,
    required this.mainInventoryCode,
    this.parentId,
    required this.mainInventoryName,
    this.usageDate,
    required this.prices,
    required this.sector,
    required this.location,
    required this.mainInventoryType,
    this.warrantyInfo,
    this.warrantyDate,
    this.avatarUrlSmall,
    this.avatarUrlMedium,
    this.avatarUrlBig,
  });

  factory InventoryItem.fromJson(Map<String, dynamic> json) {
    return InventoryItem(
      mainInventoryId: json['mainInventoryId'],
      mainInventoryCode: json['mainInventoryCode']?.trim() ?? '', // Trim whitespace and provide default
      parentId: json['parentId'],
      mainInventoryName: json['mainInventoryName'] ?? '', // Provide default if null
      usageDate: json['usageDate'], // Nullable
      prices: json['prices'] ?? '', // Provide default if null
      sector: json['sector'] ?? '', // Provide default if null
      location: json['location'] ?? '', // Provide default if null
      mainInventoryType: json['mainInventoryType'] ?? '', // Provide default if null
      warrantyInfo: json['warrantyInfo'],
      warrantyDate: json['warrantyDate'],
      avatarUrlSmall: json['avatarUrlSmall'],
      avatarUrlMedium: json['avatarUrlMedium'],
      avatarUrlBig: json['avatarUrlBig'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mainInventoryId': mainInventoryId,
      'mainInventoryCode': mainInventoryCode,
      'parentId': parentId,
      'mainInventoryName': mainInventoryName,
      'usageDate': usageDate, // Nullable
      'prices': prices,
      'sector': sector,
      'location': location,
      'mainInventoryType': mainInventoryType,
      'warrantyInfo': warrantyInfo,
      'warrantyDate': warrantyDate,
      'avatarUrlSmall': avatarUrlSmall,
      'avatarUrlMedium': avatarUrlMedium,
      'avatarUrlBig': avatarUrlBig,
    };
  }

  @override
  String toString() {
    return 'InventoryItem(mainInventoryId: $mainInventoryId, mainInventoryCode: $mainInventoryCode, mainInventoryName: $mainInventoryName, usageDate: $usageDate, prices: $prices, sector: $sector, location: $location, mainInventoryType: $mainInventoryType)';
  }
}
