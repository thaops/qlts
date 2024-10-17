// ... existing code ...
import 'package:intl/intl.dart'; // Đảm bảo bạn đã import thư viện intl

class DateUtilsCustom {
  static String formatDate(String? date) {
    if (date != null && date.isNotEmpty) {
      try {
        DateFormat inputFormat = DateFormat('MM/dd/yyyy'); // Định dạng đầu vào
        DateTime dateTime = inputFormat.parse(date); // Phân tích chuỗi thành DateTime
        return DateFormat('dd/MM/yyyy').format(dateTime); // Định dạng ngày
      } catch (e) {
        print("Error parsing date: $e"); // In ra lỗi nếu có
        return date; // Nếu không thể phân tích, giữ nguyên chuỗi
      }
    } else {
      return 'N/A'; // Hoặc một thông báo mặc định khác
    }
  }
}
  
