import 'package:dio/dio.dart';
import 'package:qlts_flutter/common/Services/api_endpoints.dart';
import 'package:qlts_flutter/common/constants/http_status_codes.dart';
import 'package:qlts_flutter/features/auth/user_login/data/model/login_res.dart';

class LoginRepository {
  final Dio dio = Dio();

  Future<LoginRes> login(String username, String password) async {
    try {
      Response response = await dio.post(
      ApiEndpoints.login,
       data: {'username': username, 'password': password},
    );
    if (response.statusCode == HttpStatusCodes.STATUS_CODE_OK) {
      return LoginRes.fromJson(response.data); // Chuyển đổi JSON thành đối tượng LoginRes
    } else {
      throw Exception('Đăng nhập thất bại: ${response.statusCode}'); // Ném lỗi nếu không thành công
    }
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }
}
