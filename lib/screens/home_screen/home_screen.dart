import 'package:darkak_e_commerce_app/screens/address_view_screen/controller/address_view_controller.dart';
import 'package:darkak_e_commerce_app/screens/checkout_screens/controller/order_package_controller.dart';
import 'package:darkak_e_commerce_app/screens/explore_screen/controller/brand_list_controller.dart';
import 'package:darkak_e_commerce_app/screens/cart_screen/controller/cart_item_controller.dart';
import 'package:darkak_e_commerce_app/screens/explore_screen/controller/category_list_controller.dart';
import 'package:darkak_e_commerce_app/screens/home_screen/controller/home_screen_controller.dart';
import 'package:darkak_e_commerce_app/screens/shop_screen/controller/product_list_controller.dart';
import 'package:darkak_e_commerce_app/screens/profile_screen/controller/profile_screen_controller.dart';
import 'package:darkak_e_commerce_app/screens/wishlist_screen/controller/wishlist_item_controller.dart';
import 'package:darkak_e_commerce_app/services/shared_preferences_service.dart';
import 'package:darkak_e_commerce_app/utils/app_colors.dart';
import 'package:darkak_e_commerce_app/screens/cart_screen/cart_screen.dart';
import 'package:darkak_e_commerce_app/screens/explore_screen/explore_screen.dart';
import 'package:darkak_e_commerce_app/screens/profile_screen/profile_screen.dart';
import 'package:darkak_e_commerce_app/screens/shop_screen/shop_screen.dart';
import 'package:darkak_e_commerce_app/screens/wishlist_screen/wishlist_screen.dart';
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
    ProfileScreen(),
  ];

  final HomeScreenController _homeScreenController = Get.find<HomeScreenController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      String token = SharedPreferencesService().getToken();
      if (token.isNotEmpty) {
        Get.find<ProductListController>().getProductList();
        Get.find<CategoryListController>().getCategoryList();
        Get.find<BrandListController>().getBrandList();
        Get.find<ProfileController>().getCurrentUser();
        Get.find<CartItemController>().getCartItem();
        Get.find<WishListItemController>().getWishListItem();
        Get.find<AddressViewController>().getAddressList();
        Get.find<OrderPackageController>().getPackageList();
      } else {
        Get.find<ProductListController>().getProductList();
        Get.find<CategoryListController>().getCategoryList();
        Get.find<BrandListController>().getBrandList();
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(builder: (controller) {
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
