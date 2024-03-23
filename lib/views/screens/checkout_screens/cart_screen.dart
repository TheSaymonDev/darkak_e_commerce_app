import 'package:darkak_e_commerce_app/controllers/add_to_wishList_controller.dart';
import 'package:darkak_e_commerce_app/controllers/cart_item_controller.dart';
import 'package:darkak_e_commerce_app/core/utils/colors.dart';
import 'package:darkak_e_commerce_app/core/utils/urls.dart';
import 'package:darkak_e_commerce_app/models/cart_item.dart';
import 'package:darkak_e_commerce_app/views/screens/final_product_details_screen.dart';
import 'package:darkak_e_commerce_app/views/widgets/common_widgets/custom_elevated_button.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:darkak_e_commerce_app/views/screens/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartItemController _cartItemController = Get.find<CartItemController>();
  int productRating = 4;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartItemController>(builder: (controller) {
      return SafeArea(
          child: controller.isLoading
              ? customCircularProgressIndicator
              : controller.cartItemList.isEmpty
                  ? Center(child: Lottie.asset(Urls.emptyCartLottie))
                  : Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Gap(16.h),
                                _buildCartItemList(controller),
                                Gap(32.h),
                                _buildSubTotalAndPromoBox,
                                Gap(32.h),
                              ],
                            ),
                          ),
                        ),
                        _buildTotalPriceAndCheckoutSection,
                      ],
                    ));
    });
  }

  Container get _buildTotalPriceAndCheckoutSection {
    return Container(
      height: 84.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      decoration: BoxDecoration(
        color: whiteClr,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 0,
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
              Text('TOTAL',
                  style: Get.textTheme.bodySmall!.copyWith(color: greyClr)),
              GetBuilder<CartItemController>(builder: (controller) {
                return Text(
                    '${Urls.takaSign}${controller.calculateSubTotal() + 50}',
                    style:
                        Get.textTheme.titleMedium!.copyWith(color: orangeClr));
              })
            ],
          ),
          const Spacer(),
          CustomElevatedButton(
              onPressed: () {
                Get.to(() => const CheckOutScreen());
              },
              buttonName: 'Checkout',
              width: 146.w)
        ],
      ),
    );
  }

  Column get _buildSubTotalAndPromoBox {
    return Column(
      children: [
        const Divider(
          color: orangeClr,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SizedBox(
            height: 50.h,
            width: double.infinity.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Sub Total',
                  style: Get.textTheme.bodyMedium,
                ),
                Text(
                  '----------------------',
                  style: Get.textTheme.bodyMedium!.copyWith(color: orangeClr),
                ),
                GetBuilder<CartItemController>(builder: (controller) {
                  return Text(
                    '${Urls.takaSign}${controller.calculateSubTotal().toString()}',
                    style: Get.textTheme.bodyMedium,
                  );
                })
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SizedBox(
            height: 50.h,
            width: double.infinity.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Delivery charge',
                  style: Get.textTheme.bodyMedium,
                ),
                Text(
                  '----------------------',
                  style: Get.textTheme.bodyMedium!.copyWith(color: orangeClr),
                ),
                Text(
                  '${Urls.takaSign}50',
                  style: Get.textTheme.bodyMedium,
                )
              ],
            ),
          ),
        ),
        const Divider(
          color: orangeClr,
        ),
        Gap(16.h),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SizedBox(
                height: 50.h,
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(child: _buildPromoInputField),
                    _buildApplyButton
                  ],
                )))
      ],
    );
  }

  Container get _buildApplyButton {
    return Container(
        height: double.infinity.h,
        width: 110.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(4.r),
                bottomRight: Radius.circular(4.r)),
            border: Border.all(color: orangeClr, width: 1.w)),
        child: Text('APPLY', style: Get.textTheme.titleMedium));
  }

  TextFormField get _buildPromoInputField {
    return TextFormField(
        cursorColor: orangeClr,
        style: Get.textTheme.bodyMedium,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4.r),
                  bottomLeft: Radius.circular(4.r)),
              borderSide: const BorderSide(color: orangeClr, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(4.r),
                  bottomRight: Radius.circular(4.r)),
              borderSide: const BorderSide(color: orangeClr, width: 1),
            ),
            contentPadding:
                EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
            hintText: 'Enter Voucher Code',
            hintStyle: Get.textTheme.bodyMedium!.copyWith(color: greyClr)));
  }

  Flexible _buildCartItemList(CartItemController controller) {
    return Flexible(
        child: ListView.separated(
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final cartItem = controller.cartItemList[index];
              return Slidable(
                  key: ValueKey<CartItem>(cartItem),
                  startActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (c) async {
                          Get.find<AddToWishListController>()
                              .addToWishList(cartItem.products!.id!);
                        },
                        backgroundColor: yellowClr,
                        foregroundColor: whiteClr,
                        icon: Icons.star,
                      ),
                    ],
                  ),
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (c) async {
                          controller.removeCartItem(cartItem.id!);
                        },
                        backgroundColor: orangeClr,
                        foregroundColor: whiteClr,
                        icon: Icons.delete,
                      ),
                    ],
                  ),
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      height: 120.h,
                      width: double.infinity,
                      child: Row(children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => FinalProductDetailsScreen(
                                product: cartItem.products!));
                          },
                          child: Container(
                            height: double.infinity.h,
                            width: 120.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              image: DecorationImage(
                                image: NetworkImage(
                                    '${Urls.imgUrl}${cartItem.products!.images![0].path}'),
                              ),
                            ),
                          ),
                        ),
                        Gap(50.w),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${cartItem.products!.name}',
                                  style: Get.textTheme.bodyLarge),
                              Row(
                                children: [
                                  Text(
                                      '${Urls.takaSign}${cartItem.products!.offerPrice.toString()}',
                                      style: Get.textTheme.bodyMedium!
                                          .copyWith(color: orangeClr)),
                                  Gap(60.w),
                                  Text(
                                    'Size: ${cartItem.size}',
                                    style: Get.textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                              Row(
                                  children: List.generate(
                                      5,
                                      (index) => Icon(Icons.star,
                                          size: 23.sp,
                                          color: index < productRating
                                              ? yellowClr
                                              : greyClr))),
                              _buildProductIncrementDecrement(index)
                            ])
                      ])));
            },
            separatorBuilder: (context, index) => Gap(16.h),
            itemCount: controller.cartItemList.length));
  }

  Container _buildProductIncrementDecrement(int index) {
    return Container(
        height: 30.h,
        width: 95.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r), color: filledClr),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          InkWell(
              onTap: () => _cartItemController.decrementQuantity(index),
              child: Icon(Icons.remove, color: Colors.grey, size: 20.sp)),
          GetBuilder<CartItemController>(builder: (controller) {
            return Text('${controller.cartItemList[index].quantity}',
                style: Get.textTheme.bodyMedium);
          }),
          InkWell(
            onTap: () => _cartItemController.incrementQuantity(index),
            child: Icon(Icons.add, color: Colors.grey, size: 20.sp),
          )
        ]));
  }
}
