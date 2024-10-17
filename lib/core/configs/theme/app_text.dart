import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qlts_flutter/core/configs/theme/app_colors.dart';

class AppText {
  static final titleHome = TextStyle(
    fontFamily: 'assets/fonts/Satoshi-Bold.ttf',
    fontSize: 24.0.sp,
  );

  static final nameSong = TextStyle(
    fontFamily: 'assets/fonts/Satoshi-Medium.ttf',
    fontSize: 18.0.sp,
  );

  static final textLight = TextStyle(
      fontFamily: 'assets/fonts/Satoshi-Light.ttf',
      fontSize: 12.0.sp,
      color: AppColors.grey);
}
