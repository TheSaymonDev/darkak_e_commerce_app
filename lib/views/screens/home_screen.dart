import 'package:darkak_e_commerce_app/controllers/home_screen_controller.dart';
import 'package:darkak_e_commerce_app/controllers/productList_controller.dart';
import 'package:darkak_e_commerce_app/controllers/profile_controller.dart';
import 'package:darkak_e_commerce_app/core/app_data.dart';
import 'package:darkak_e_commerce_app/views/screens/cart_screen.dart';
import 'package:darkak_e_commerce_app/views/screens/explore_screen.dart';
import 'package:darkak_e_commerce_app/views/screens/profile_screen.dart';
import 'package:darkak_e_commerce_app/views/screens/shop_screen.dart';
import 'package:darkak_e_commerce_app/views/screens/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _widgetList = [
    ExploreScreen(),
    const ShopScreen(),
    const CartScreen(),
    const WishListScreen(),
    const ProfileScreen(),
  ];

  final HomeScreenController _homeScreenController = Get.put(HomeScreenController());

  final ProfileScreen _profileScreen = Get.put(const ProfileScreen());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<ProductListController>().fetchProducts();
    Get.find<ProfileController>().fetchProfile();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: whiteClr,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
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
      }
    );
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
