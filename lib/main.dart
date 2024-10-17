import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qlts_flutter/common/Services/services.dart';
import 'package:qlts_flutter/router/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final services = await Services.create();
  Get.put(services);
  final accessToken = await services.getAccessToken();
  print("accessToken: $accessToken");
  runApp(MyApp(accessToken));
}

class MyApp extends StatelessWidget {
  final String accessToken;

  MyApp(this.accessToken);
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      designSize:
          Size(screenWidth, screenHeight), // Kích thước thiết kế của bạn
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'My App',
          initialRoute: accessToken.isEmpty
              ? AppRoutes.auth
              : AppRoutes.bottomNavBar, // Đường dẫn khởi đầu
          getPages: AppRoutes.routes, // Đường dẫn đã định nghĩa
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
        );
      },
    );
  }
}
