import 'package:e_commerce_app/reusable/colors.dart';
import 'package:e_commerce_app/reusable/styles.dart';
import 'package:e_commerce_app/screens/bottom_nav_bar_screens/bottom_nav_bar_pages/cart_page.dart';
import 'package:e_commerce_app/screens/bottom_nav_bar_screens/bottom_nav_bar_pages/favourite_page.dart';
import 'package:e_commerce_app/screens/bottom_nav_bar_screens/bottom_nav_bar_pages/home_page.dart';
import 'package:e_commerce_app/screens/bottom_nav_bar_screens/bottom_nav_bar_pages/shop_page.dart';
import 'package:e_commerce_app/screens/bottom_nav_bar_screens/bottom_nav_bar_pages/user_account_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavBarPage extends StatefulWidget {
  BottomNavBarPage({super.key});

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  int _currentIndex = 0;

  List<Widget> _widgetList = [
    HomePage(),
    ShopPage(),
    CartPage(),
    FavouritePage(),
    UserAccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          _buildNavigationBarItem(0, Icons.home_filled, 'Home'),
          _buildNavigationBarItem(1, Icons.shopping_cart, 'Shop'),
          _buildNavigationBarItem(2, Icons.shopping_bag, 'Cart'),
          _buildNavigationBarItem(3, Icons.favorite, 'Favourite'),
          _buildNavigationBarItem(4, Icons.person, 'Account'),
        ],
      ),
      body: _widgetList.elementAt(_currentIndex),
    );
  }

  BottomNavigationBarItem _buildNavigationBarItem(
      int index, IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: _currentIndex == index
          ? CircleAvatar(
              backgroundColor: orangeColor,
              child: Icon(
                icon,
                color: Colors.white,
              ),
            )
          : Icon(
              icon,
              size: 25.sp,
              color: textClr,
            ),
      label: _currentIndex == index ? '' : label,
    );
  }
}
