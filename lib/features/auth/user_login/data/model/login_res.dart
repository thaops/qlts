class LoginRes {
  int statusCode;
  String message;
  int totalRecord;
  Data data;

  LoginRes({
    required this.statusCode,
    required this.message,
    required this.totalRecord,
    required this.data,
  });

  // Phương thức để tạo đối tượng LoginRes từ JSON
  factory LoginRes.fromJson(Map<String, dynamic> json) => LoginRes(
        statusCode: json["statusCode"],
        message: json["message"],
        totalRecord: json["totalRecord"],
        data: Data.fromJson(json["data"]),
      );

  // Phương thức để chuyển đổi đối tượng LoginRes thành JSON
  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "totalRecord": totalRecord,
        "data": data.toJson(),
      };
}
class Data {
  String userId;
  String accessToken;
  String refreshToken;

  Data({
    required this.userId,
    required this.accessToken,
    required this.refreshToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userId: json["userId"],
    accessToken: json["accessToken"],
    refreshToken: json["refreshToken"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "accessToken": accessToken,
    "refreshToken": refreshToken,
  };
}