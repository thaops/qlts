import 'package:intl/intl.dart'; // Đảm bảo bạn đã import thư viện intl

class DateUtilsCustom {
  // Hàm để định dạng DateTime thành chuỗi ngày tháng
  static String formatDate(DateTime? date) {
    if (date != null) {
      try {
        // Định dạng ngày tháng năm
        return DateFormat('dd/MM/yyyy').format(date); // Định dạng ngày
      } catch (e) {
        print("Error formatting date: $e"); // In ra lỗi nếu có
        return date.toString(); // Nếu không thể định dạng, giữ nguyên chuỗi
      }
    } else {
      return 'N/A'; // Hoặc một thông báo mặc định khác
    }
  }

  // Hàm để chuyển đổi chuỗi ISO 8601 thành DateTime và định dạng
  static String formatStringDate(String? date) {
    if (date != null && date.isNotEmpty) {
      try {
        DateTime dateTime = DateTime.parse(date); // Phân tích chuỗi ISO 8601 thành DateTime
        return formatDate(dateTime); // Sử dụng hàm formatDate để định dạng
      } catch (e) {
        print("Error parsing date: $e"); // In ra lỗi nếu có
        return date; // Nếu không thể phân tích, giữ nguyên chuỗi
      }
    } else {
      return 'N/A'; // Hoặc một thông báo mặc định khác
    }
  }
}