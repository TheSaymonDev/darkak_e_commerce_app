import 'package:darkak_e_commerce_app/screens/home_screen/controllers/bottom_nav_controller.dart';
import 'package:darkak_e_commerce_app/utils/app_colors.dart';
import 'package:darkak_e_commerce_app/screens/cart_screen/cart_screen.dart';
import 'package:darkak_e_commerce_app/screens/explore_screen/explore_screen.dart';
import 'package:darkak_e_commerce_app/screens/profile_screen/profile_screen.dart';
import 'package:darkak_e_commerce_app/screens/shop_screen/shop_screen.dart';
import 'package:darkak_e_commerce_app/screens/wishlist_screen/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Widget> _widgetList = [
    ExploreScreen(),
    const ShopScreen(),
    CartScreen(),
    const WishListScreen(),
    ProfileScreen(),
  ];

  final _homeScreenController = Get.find<BottomNavController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavController>(builder: (controller) {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          backgroundColor: const Color(0xFFFFF8DC),
          currentIndex: controller.currentIndex,
          onTap: (int index) => controller.changeIndex(index),
          items: [
            _buildNavigationBarItem(0, Icons.home_filled, 'Home'),
            _buildNavigationBarItem(1, Icons.shopping_cart, 'Shop'),
            _buildNavigationBarItem(2, Icons.shopping_bag, 'Cart'),
            _buildNavigationBarItem(3, Icons.favorite, 'Favourite'),
            _buildNavigationBarItem(4, Icons.person, 'Account'),
          ],
        ),
        body: _widgetList.elementAt(controller.currentIndex),
      );
    });
  }

  BottomNavigationBarItem _buildNavigationBarItem(
      int index, IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: _homeScreenController.currentIndex == index
          ? CircleAvatar(
              backgroundColor: orangeClr,
              child: Icon(
                icon,
                color: Colors.white,
              ),
            )
          : Icon(
              icon,
              size: 25.sp,
              color: blackClr,
            ),
      label: _homeScreenController.currentIndex == index ? '' : label,
    );
  }
}
