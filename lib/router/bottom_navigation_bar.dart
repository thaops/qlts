// lib/bottom_nav_bar_page.dart
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:qlts_flutter/core/configs/theme/app_colors.dart';
import 'package:qlts_flutter/features/presentation/asset_tracke/view/asset_tracker.dart';
import 'package:qlts_flutter/features/presentation/setting/view/setting.dart';
import 'package:qlts_flutter/router/app_router.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavBarPageState createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const AssetTracker(),
    const Setting(),
  ];

  final List<IconData> _iconList = [
    Icons.inventory_2,
    Icons.settings,
  ];

  final List<Color> _iconColors = [
    AppColors.black,
    AppColors.black,
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      for (int i = 0; i < _iconColors.length; i++) {
        _iconColors[i] = i == index ? AppColors.primary : AppColors.black;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: _pages[_selectedIndex], // Hiển thị trang tương ứng
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.qrCode);
        },
        backgroundColor: AppColors.primary,
        child: Icon(Icons.qr_code_scanner, color: AppColors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: _iconList,
        activeIndex: _selectedIndex,
        gapLocation: GapLocation.center, // Đặt vị trí khoảng cách giữa các tab
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: _onItemTapped, // Cập nhật chỉ số tab khi nhấn
        iconSize: 24,
        inactiveColor:
            AppColors.black, // Màu mặc định cho các biểu tượng không hoạt động
        activeColor: AppColors.primary, // Màu cho biểu tượng đang hoạt động
      ),
    );
  }
}
