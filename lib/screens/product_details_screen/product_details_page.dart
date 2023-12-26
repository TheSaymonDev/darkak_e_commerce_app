import 'package:e_commerce_app/models/product_review_model.dart';
import 'package:e_commerce_app/reusable/colors.dart';
import 'package:e_commerce_app/reusable/styles.dart';
import 'package:e_commerce_app/reusable/widgets/app_back_appbar.dart';
import 'package:e_commerce_app/reusable/widgets/app_orange_button.dart';
import 'package:e_commerce_app/screens/product_details_screen/product_view_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  final double _height = 400.h;
  bool _showMore = false;
  int _quantity = 1;

  String _productSize = 'S';
  final List<String> _items = ['S', 'M', 'L', 'XL', 'XXL'];

  List<String> variousProductList = [
    'assets/images/black.png',
    'assets/images/blue.png',
    'assets/images/red.png',
    'assets/images/yellow.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SizedBox(
          height: double.infinity.h,
          width: double.infinity.w,
          child: Column(
            children: [
              Expanded(
                flex: 9,
                child: CustomScrollView(
                  slivers: [
                    SliverPersistentHeader(
                      pinned: true,
                      floating: true,
                      delegate: _SliverAppBarDelegate(
                        minHeight: 196.h,
                        maxHeight: _height,
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/product-img.png'),
                                fit: BoxFit.cover),
                          ),
                          child: LayoutBuilder(
                            builder: (context, constraints) => Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: IconButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    icon: Icon(
                                      Icons.keyboard_arrow_left,
                                      size: 30.sp,
                                      color: orangeColor,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 16.h),
                                  child: Visibility(
                                    visible: constraints.maxHeight >= _height,
                                    child: Container(
                                      height: 100.h,
                                      width: 398.w,
                                      decoration: BoxDecoration(
                                        color: backgroundColor,
                                        borderRadius:
                                            BorderRadius.circular(16.r),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: List.generate(
                                          variousProductList.length,
                                          (index) => InkWell(
                                            onTap: () {},
                                            child: Container(
                                              height: 90.h,
                                              width: 90.w,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16.r),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        variousProductList[
                                                            index]),
                                                    fit: BoxFit.cover),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        margin: EdgeInsets.only(top: 16.h),
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Linen Fashionable Ready Stitched',
                                    style: myTextStyle(
                                        25.sp, FontWeight.bold, textColor),
                                  ),
                                ),
                                Text(
                                  'ID-76232982',
                                  style: myTextStyle(
                                      25.sp, FontWeight.bold, textColor),
                                ),
                              ],
                            ),
                            Gap(16.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _circularContainer(
                                  Row(
                                    children: [
                                      Text(
                                        'Size:',
                                        style: myTextStyle(15.sp,
                                            FontWeight.normal, textColor),
                                      ),
                                      const Spacer(),
                                      DropdownButton(
                                        underline: const SizedBox(
                                          height: 0,
                                        ),
                                        style: myTextStyle(
                                            15.sp, FontWeight.bold, textColor),
                                        items: _items.map((String item) {
                                          return DropdownMenuItem(
                                            value: item,
                                            child: Text(item),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            _productSize = newValue!;
                                          });
                                        },
                                        value: _productSize,
                                      ),
                                    ],
                                  ),
                                ),
                                _circularContainer(
                                  Row(
                                    children: [
                                      Text(
                                        'Color:',
                                        style: myTextStyle(15.sp,
                                            FontWeight.normal, textColor),
                                      ),
                                      const Spacer(),
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          height: 22.h,
                                          width: 22.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                              color: textColor),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Gap(16.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _circularContainer(
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              if (_quantity > 1) {
                                                _quantity--;
                                              }
                                            });
                                          },
                                          child: Icon(
                                            Icons.remove,
                                            size: 30.sp,
                                            color: greyColor,
                                          )),
                                      Text(
                                        _quantity.toString(),
                                        style: myTextStyle(20.sp,
                                            FontWeight.normal, greyColor),
                                      ),
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              _quantity++;
                                            });
                                          },
                                          child: Icon(
                                            Icons.add,
                                            size: 30.sp,
                                            color: greyColor,
                                          )),
                                    ],
                                  ),
                                ),
                                _circularContainer(
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 20.sp,
                                        color: yellowColor,
                                      ),
                                      Text(
                                        'Ratting',
                                        style: myTextStyle(20.sp,
                                            FontWeight.normal, textColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Gap(16.h),
                            Text(
                              'Details',
                              style: myTextStyle(
                                  20.sp, FontWeight.bold, textColor),
                            ),
                            Gap(8.h),
                            Column(
                              children: [
                                Text(
                                  'Nike Dri-FIT is a polyester fabric designed to help you keep dry so you can more comfortably work harder, longer.',
                                  style: myTextStyle(
                                      20.sp, FontWeight.normal, textColor),
                                ),
                                if (_showMore) ...[
                                  Text(
                                    'Nike Dri-FIT is a polyester fabric designed to help you keep dry so you can more comfortably work harder, longer.',
                                    style: myTextStyle(
                                        20.sp, FontWeight.normal, textColor),
                                  )
                                ]
                              ],
                            ),
                            Center(
                              child: TextButton(
                                onPressed: () =>
                                    setState(() => _showMore = !_showMore),
                                child: Text(
                                  _showMore ? "See Less" : "See More",
                                  style: myTextStyle(
                                      20.sp, FontWeight.bold, orangeColor),
                                ),
                              ),
                            ),
                            Text(
                              'Reviews',
                              style: myTextStyle(
                                  20.sp, FontWeight.bold, textColor),
                            ),
                            Gap(8.h),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                'Write your review',
                                style: myTextStyle(
                                    20.sp, FontWeight.normal, orangeColor),
                              ),
                            ),
                            Gap(30.h),
                          ],
                        ),
                      ),
                    ),
                    SliverList.separated(
                      itemBuilder: (context, index) {
                        final productReview =
                            ProductReviewModel.productReviewList[index];
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 46.h,
                                width: 46.w,
                                child: CircleAvatar(
                                  backgroundColor: orangeColor,
                                  backgroundImage:
                                      AssetImage(productReview.profileImage),
                                ),
                              ),
                              Gap(26.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          productReview.name,
                                          style: myTextStyle(20.sp,
                                              FontWeight.bold, textColor),
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              size: 25.sp,
                                              color: yellowColor,
                                            ),
                                            Text(
                                              productReview.rating.toString(),
                                              style: myTextStyle(20.sp,
                                                  FontWeight.normal, textColor),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Gap(8.h),
                                    Text(
                                      productReview.message,
                                      style: myTextStyle(
                                          15.sp, FontWeight.normal, textColor),
                                    ),
                                    Gap(8.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Row(
                                            children: List.generate(
                                                productReview
                                                    .productImage.length,
                                                (index) => Container(
                                                      height: 58.h,
                                                      width: 58.w,
                                                      margin: EdgeInsets.only(
                                                          right: 10.w),
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                  productReview
                                                                          .productImage[
                                                                      index]),
                                                              fit: BoxFit
                                                                  .cover)),
                                                    )),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Helpful',
                                              style: myTextStyle(20.sp,
                                                  FontWeight.normal, textColor),
                                            ),
                                            Gap(4.w),
                                            InkWell(
                                              onTap: () {
                                                productReview.toggleHelpful();
                                                setState(() {});
                                              },
                                              child: SizedBox(
                                                height: 20.h,
                                                width: 22.w,
                                                child: SvgPicture.asset(
                                                  color:
                                                      productReview.isLiked ==
                                                              true
                                                          ? null
                                                          : greyColor,
                                                  'assets/images/liked-icon.svg',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Gap(20.h),
                      itemCount: ProductReviewModel.productReviewList.length,
                    ),
                    SliverToBoxAdapter(child: Gap(16.h))
                  ],
                ),
              ),
              Container(
                height: 92.h,
                width: double.infinity.w,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, -3), // Offset for top shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Price',
                            style: myTextStyle(
                                15.sp, FontWeight.normal, greyColor),
                          ),
                          Text(
                            '${takaSign}1500',
                            style: myTextStyle(
                                20.sp, FontWeight.bold, orangeColor),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.store,
                            size: 30.sp,
                            color: orangeColor,
                          ),
                          Text(
                            'Store',
                            style: myTextStyle(
                                20.sp, FontWeight.normal, textColor),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.chat,
                            size: 30.sp,
                            color: orangeColor,
                          ),
                          Text(
                            'Chat',
                            style: myTextStyle(
                                20.sp, FontWeight.normal, textColor),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      focusColor: backgroundColor,
                      child: Container(
                        width: 146.w,
                        height: 50.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r),
                            color: orangeColor),
                        child: Text(
                          'Add to cart',
                          style: myTextStyle(
                              20.sp, FontWeight.bold, backgroundColor),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _circularContainer(Widget child) {
    return Container(
      height: 40.h,
      width: 160.w,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: shadowDecoration1(),
      child: child,
    );
  }

  // void _showDropDownButton() {
  //   DropdownButton(
  //     items: _items.map((String item) {
  //       return DropdownMenuItem(
  //         value: item,
  //         child: Text(item),
  //       );
  //     }).toList(),
  //     onChanged: (String? newValue) {
  //       setState(() {
  //         _dropDownValue = newValue!;
  //       });
  //     },
  //     value: _dropDownValue,
  //   );
  // }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
