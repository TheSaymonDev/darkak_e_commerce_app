import 'package:e_commerce_app/models/cart_product_item_model.dart';
import 'package:e_commerce_app/reusable/colors.dart';
import 'package:e_commerce_app/reusable/styles.dart';
import 'package:e_commerce_app/reusable/widgets/app_orange_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int calculateTotal() {
    int total = 0;
    for (var item in CartProductItemModel.cartProductItemList) {
      total += item.productPrice * item.productQuantity;
    }
    return total;
  }

  void incrementQuantity(int index) {
    setState(() {
      CartProductItemModel.cartProductItemList[index].productQuantity++;
    });
  }

  void decrementQuantity(int index) {
    setState(() {
      if (CartProductItemModel.cartProductItemList[index].productQuantity > 1) {
        CartProductItemModel.cartProductItemList[index].productQuantity--;
      }
    });
  }

  void deleteCartItem(int index) {
    setState(() {
      CartProductItemModel.cartProductItemList.removeAt(index);
    });
  }

  void toggleFavorite(int index) {
    setState(() {
      CartProductItemModel.cartProductItemList[index].isFavourite =
      !CartProductItemModel.cartProductItemList[index].isFavourite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 25.h),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    final cartProductList =
                        CartProductItemModel.cartProductItemList[index];
                    return Dismissible(
                      key: ValueKey<CartProductItemModel>(cartProductList),
                      onDismissed: (direction) {
                        if (direction == DismissDirection.endToStart) {
                          // Swipe to delete
                          deleteCartItem(index);
                        } else if (direction == DismissDirection.startToEnd) {
                          // Swipe to favorite
                          //toggleFavorite(index);
                          deleteCartItem(index);
                        }
                      },
                      background: Container(
                        color: yellowColor,
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.w),
                          child: Icon(
                            Icons.favorite,
                            color: Colors.white,
                            size: 30.sp,
                          ),
                        ),
                      ),
                      secondaryBackground: Container(
                        color: orangeColor,
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 20.w),
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 30.sp,
                          ),
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        height: 120.h,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Container(
                              height: double.infinity.h,
                              width: 120.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.r),
                                image: DecorationImage(
                                  image: AssetImage(cartProductList.productImg),
                                ),
                              ),
                            ),
                            Gap(70.w),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cartProductList.productName,
                                  style: myTextStyle(
                                      25.sp, FontWeight.normal, textColor),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '$takaSign${cartProductList.productPrice.toString()}',
                                      style: myTextStyle(20.sp,
                                          FontWeight.normal, orangeColor),
                                    ),
                                    Gap(60.w),
                                    Text(
                                      'Size: ${cartProductList.productSize}',
                                      style: myTextStyle(
                                          20.sp, FontWeight.normal, textColor),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: List.generate(
                                      5,
                                      (index) => Icon(
                                            Icons.star,
                                            size: 23.sp,
                                            color: index <
                                                    cartProductList
                                                        .productRating
                                                ? yellowColor
                                                : greyColor,
                                          )),
                                ),
                                Container(
                                  height: 30.h,
                                  width: 95.w,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.r),
                                    color: filledColor,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          decrementQuantity(index);
                                        },
                                        child: Icon(
                                          Icons.remove,
                                          color: Colors.grey,
                                          size: 20.sp,
                                        ),
                                      ),
                                      Text(
                                        cartProductList.productQuantity
                                            .toString(),
                                        style: myTextStyle(20.sp,
                                            FontWeight.normal, textColor),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          incrementQuantity(index);
                                        },
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.grey,
                                          size: 20.sp,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Gap(16.h),
                  itemCount: CartProductItemModel.cartProductItemList.length),
            ),
          ),
          Container(
            height: 84.h,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            decoration: BoxDecoration(
              color: backgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 10,
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
          ),
        ],
      ),
    );
  }
}
