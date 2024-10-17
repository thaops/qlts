import 'package:shared_preferences/shared_preferences.dart';

class Services {
  final SharedPreferences _prefs;

  Services(this._prefs); // Tiêm phụ thuộc cho SharedPreferences

  static Future<Services> create() async {
    final prefs = await SharedPreferences.getInstance();
    return Services(prefs);
  }

  Future<void> saveAccessToken(String accessToken) async {
    await _prefs.setString('accessToken', accessToken); // Lưu accessToken
  }

  Future<String> getAccessToken() async {
    String? token = _prefs.getString('accessToken'); // Lấy accessToken
    return token ?? ''; // Trả về accessToken hoặc chuỗi rỗng
  }
  Future<void> deleteAccessToken() async {
    await _prefs.remove('accessToken'); // Xóa accessToken
  }
}
