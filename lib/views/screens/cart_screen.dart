import 'package:darkak_e_commerce_app/core/app_data.dart';
import 'package:darkak_e_commerce_app/models/cart_product_item_model.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_elevated_button.dart';
import 'package:darkak_e_commerce_app/views/screens/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
                   Flexible(
                     child: ListView.separated(
                         scrollDirection: Axis.vertical,
                         physics: const NeverScrollableScrollPhysics(),
                         shrinkWrap: true,
                         itemBuilder: (context, index) {
                           final cartProductList =
                           CartProductItemModel.cartProductItemList[index];
                           return Slidable(
                             key: ValueKey<CartProductItemModel>(cartProductList),
                             startActionPane: ActionPane(
                               motion: const ScrollMotion(),
                               children: [
                                 SlidableAction(
                                   onPressed: (c) {},
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
                                   onPressed: (c) {
                                     deleteCartItem(index);
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
                                         style: myStyle(
                                             25.sp, FontWeight.normal, blackClr),
                                       ),
                                       Row(
                                         children: [
                                           Text(
                                             '$takaSign${cartProductList.productPrice.toString()}',
                                             style: myStyle(20.sp,
                                                 FontWeight.normal, orangeClr),
                                           ),
                                           Gap(60.w),
                                           Text(
                                             'Size: ${cartProductList.productSize}',
                                             style: myStyle(
                                                 20.sp, FontWeight.normal, blackClr),
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
                                                   ? yellowClr
                                                   : greyClr,
                                             )),
                                       ),
                                       Container(
                                         height: 30.h,
                                         width: 95.w,
                                         alignment: Alignment.center,
                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(4.r),
                                           color: filledClr,
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
                                               style: myStyle(20.sp,
                                                   FontWeight.normal, blackClr),
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
                   Gap(32.h),
                   Column(
                     children: [
                       Divider(
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
                                 style:
                                 myStyle(20.sp, FontWeight.normal, blackClr),
                               ),
                               Text(
                                 '----------------------',
                                 style: myStyle(
                                     20.sp, FontWeight.normal, orangeClr),
                               ),
                               Text(
                                 '$takaSign${calculateSubTotal()}',
                                 style:
                                 myStyle(20.sp, FontWeight.normal, blackClr),
                               )
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
                                 style:
                                 myStyle(20.sp, FontWeight.normal, blackClr),
                               ),
                               Text(
                                 '----------------------',
                                 style: myStyle(
                                     20.sp, FontWeight.normal, orangeClr),
                               ),
                               Text(
                                 '${takaSign}50',
                                 style:
                                 myStyle(20.sp, FontWeight.normal, blackClr),
                               )
                             ],
                           ),
                         ),
                       ),
                       Divider(
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
                               Expanded(
                                 child: TextFormField(
                                   cursorColor: orangeClr,
                                   style:
                                   myStyle(20.sp, FontWeight.normal, blackClr),
                                   decoration: InputDecoration(
                                     enabledBorder: OutlineInputBorder(
                                       borderRadius: BorderRadius.only(topLeft: Radius.circular(4.r), bottomLeft: Radius.circular(4.r)),
                                       borderSide: BorderSide(color: orangeClr, width: 1),
                                     ),
                                     focusedBorder: OutlineInputBorder(
                                       borderRadius: BorderRadius.only(topRight: Radius.circular(4.r), bottomRight: Radius.circular(4.r)),
                                       borderSide: BorderSide(color: orangeClr, width: 1),
                                     ),
                                     contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                                     hintText: 'Enter Voucher Code',
                                     hintStyle: myStyle(
                                         20.sp, FontWeight.normal, greyClr),
                                   ),
                                 ),
                               ),
                               Container(
                                 height: double.infinity.h,
                                 width: 110.w,
                                 alignment: Alignment.center,
                                 decoration: BoxDecoration(
                                     borderRadius: BorderRadius.only(topRight: Radius.circular(4.r), bottomRight: Radius.circular(4.r)),
                                     border: Border.all(color: orangeClr, width: 1.w)),
                                 child: Text(
                                   'APPLY',
                                   style: myStyle(20.sp, FontWeight.bold, blackClr),
                                 ),
                               )
                             ],
                           ),
                         ),
                       )
                     ],
                   ),
                   Gap(32.h),
                 ],
               ),
             ),
           ),
            Container(
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
                      Text(
                        'TOTAL',
                        style: myStyle(15.sp, FontWeight.normal, Colors.grey),
                      ),
                      Text(
                        '$takaSign${calculateSubTotal()+50}',
                        style: myStyle(20.sp, FontWeight.bold, orangeClr),
                      )
                    ],
                  ),
                  const Spacer(),
                  CustomElevatedButton(
                      onPressed: () {
                        Get.to(()=>CheckOutScreen());
                      }, buttonName: 'Checkout', width: 146.w)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void deleteCartItem(int index) {
    setState(() {
      CartProductItemModel.cartProductItemList.removeAt(index);
    });
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

  int calculateSubTotal() {
    int subTotal = 0;
    for (var item in CartProductItemModel.cartProductItemList) {
      subTotal += item.productPrice * item.productQuantity;
    }
    return subTotal;

  }

}


