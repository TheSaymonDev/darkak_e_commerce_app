import 'package:e_commerce_app/screens/cart_screen/cart_page_components/cart_checkout.dart';
import 'package:e_commerce_app/screens/cart_screen/cart_page_components/cart_items.dart';
import 'package:e_commerce_app/screens/cart_screen/cart_page_components/cart_total_cost.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: double.infinity.h,
        width: double.infinity.w,
        child: Column(
          children: [
            Expanded(
             child: SingleChildScrollView(
               child: Column(
                 mainAxisSize: MainAxisSize.min,
                 children: [
                   Gap(16.h),
                   const Flexible(
                     child: CartItems(),
                   ),
                   Gap(32.h),
                   const CartTotalCost(),
                   Gap(32.h),
                 ],
               ),
             ),
           ),
            const CartCheckout(),
          ],
        ),
      ),
    );
  }
}


