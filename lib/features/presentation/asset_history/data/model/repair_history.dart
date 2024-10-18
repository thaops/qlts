class RepairHistory {
  final String historyRepairId;
  final String mainInventoryId;
  final String description;
  final int quantity;
  final double estimatePrice;
  final String supplier;
  final String note;
  final DateTime repairDate;
  final String? parentId;
  final String status;
  final DateTime? completeDate;
  final String? avatarUrlSmall;
  final String? avatarUrlMedium;
  final String? avatarUrlBig;

  RepairHistory({
    required this.historyRepairId,
    required this.mainInventoryId,
    required this.description,
    required this.quantity,
    required this.estimatePrice,
    required this.supplier,
    required this.note,
    required this.repairDate,
    this.parentId,
    required this.status,
    this.completeDate,
    this.avatarUrlSmall,
    this.avatarUrlMedium,
    this.avatarUrlBig,
  });

  factory RepairHistory.fromJson(Map<String, dynamic> json) {
    return RepairHistory(
      historyRepairId: json['historyRepairId'],
      mainInventoryId: json['mainInventoryId'],
      description: json['description'],
      quantity: json['quantity'],
      estimatePrice: json['estimatePrice'],
      supplier: json['supplier'],
      note: json['note'],
      repairDate: DateTime.parse(json['repairDate']),
      parentId: json['parentId'],
      status: json['status'],
      completeDate: json['completeDate'] != null ? DateTime.parse(json['completeDate']) : null,
      avatarUrlSmall: json['avatarUrlSmall'],
      avatarUrlMedium: json['avatarUrlMedium'],
      avatarUrlBig: json['avatarUrlBig'],
    );
  }
}

class ApiResponse {
  final int statusCode;
  final String message;
  final int totalRecord;
  final List<RepairHistory> data;

  ApiResponse({
    required this.statusCode,
    required this.message,
    required this.totalRecord,
    required this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List; // Đảm bảo rằng bạn đang lấy danh sách từ 'data'
    List<RepairHistory> repairHistoryList = list.map((i) => RepairHistory.fromJson(i)).toList();

    return ApiResponse(
      statusCode: json['statusCode'],
      message: json['message'],
      totalRecord: json['totalRecord'],
      data: repairHistoryList,
    );
  }
}
