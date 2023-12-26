import 'package:e_commerce_app/models/cart_product_item_model.dart';
import 'package:e_commerce_app/reusable/colors.dart';
import 'package:e_commerce_app/reusable/styles.dart';
import 'package:e_commerce_app/reusable/widgets/app_orange_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartCheckout extends StatelessWidget {
  const CartCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 3,
            offset: const Offset(0, -3), // Offset for top shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'TOTAL',
                style: myTextStyle(15.sp, FontWeight.normal, Colors.grey),
              ),
              Text(
                '$takaSign${calculateTotal()}',
                style: myTextStyle(20.sp, FontWeight.bold, orangeColor),
              )
            ],
          ),
          const Spacer(),
          AppOrangeButton(
              onPressed: () {}, buttonName: 'Checkout', width: 146.w)
        ],
      ),
    );
  }
  int calculateTotal() {
    int total = 0;
    for (var item in CartProductItemModel.cartProductItemList) {
      total += item.productPrice * item.productQuantity;
    }
    return total;
  }

}
