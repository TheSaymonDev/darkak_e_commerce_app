import 'package:darkak_e_commerce_app/core/app_data.dart';
import 'package:darkak_e_commerce_app/models/final_product.dart';
import 'package:darkak_e_commerce_app/views/screens/home_screen.dart';
import 'package:darkak_e_commerce_app/views/screens/product_view_screen.dart';
import 'package:darkak_e_commerce_app/views/screens/review_screen.dart';
import 'package:darkak_e_commerce_app/views/screens/store_screen.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_bottom_sheet.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_card_style.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_coupon_code.dart';
import 'package:darkak_e_commerce_app/views/widgets/product_details_screen_widgets/custom_drop_down.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class FinalProductDetailsScreen extends StatefulWidget {

  final Product products;
  const FinalProductDetailsScreen({super.key, required this.products});

  @override
  State<FinalProductDetailsScreen> createState() =>
      _FinalProductDetailsScreenState();
}

class _FinalProductDetailsScreenState extends State<FinalProductDetailsScreen> {
  int selectedImg = 0;
  final double _height = 400.h;
  bool _isExpanded = false;
  int _quantity = 1;

  List<String> sizes = ['S', 'M'];
  int selectedSizeIndex = 0;

  List<String> colors = ['Red', 'Blue'];
  int selectedColorIndex = 0;

  final double productRating = 4.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity.h,
          width: double.infinity.w,
          child: Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverPersistentHeader(
                      pinned: true,
                      floating: true,
                      delegate: _SliverAppBarDelegate(
                        minHeight: 200.h,
                        maxHeight: _height,
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => ProductViewPage(
                              imagePath: widget.products.images![selectedImg].path,
                              imagesPath: widget.products.images,
                            ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      '$imgUrl${widget.products.images![selectedImg].path}'),
                                  fit: BoxFit.cover),
                            ),
                            child: LayoutBuilder(
                              builder: (context, constraints) => Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                        color: orangeClr,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16.w, vertical: 16.h),
                                    child: Visibility(
                                      visible: constraints.maxHeight >= _height,
                                      child: Container(
                                        height: 100.h,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.w, vertical: 8.w),
                                        alignment: Alignment.center,
                                        child: ListView.separated(
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) =>
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      selectedImg = index;
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 80.h,
                                                    width: 90.w,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        16.r,
                                                      ),
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                            '$imgUrl${widget.products.images![index].path}',
                                                          ),
                                                          fit: BoxFit.cover),
                                                    ),
                                                  ),
                                                ),
                                            separatorBuilder:
                                                (context, index) => Gap(8.w),
                                            itemCount:
                                                widget.products.images!.length),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
                            Text(
                              '${widget.products.name}',
                              style: Get.textTheme.titleLarge,
                            ),
                            Gap(16.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomCardStyle(
                                  width: 160.w,
                                  height: 40.h,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.w),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Size:',
                                        style: Get.textTheme.bodySmall,
                                      ),
                                      const Spacer(),
                                      CustomDropdown(
                                          initialSelectionIndex: selectedSizeIndex,
                                          items: sizes,
                                          onChanged: (newValue) {
                                            setState(() {
                                              selectedSizeIndex =
                                                  sizes.indexOf(newValue!);
                                            });
                                          })
                                      // buildSizeDropdown(widget.attributes),
                                    ],
                                  ),
                                ),
                                CustomCardStyle(
                                  width: 160.w,
                                  height: 40.h,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.w),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Color:',
                                        style: myStyle(
                                            15.sp, FontWeight.normal, blackClr),
                                      ),
                                      const Spacer(),
                                      CustomDropdown(
                                          initialSelectionIndex: selectedColorIndex,
                                          items: colors,
                                          onChanged: (newValue) {
                                            setState(() {
                                              selectedColorIndex =
                                                  colors.indexOf(newValue!);
                                            });
                                          })
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Gap(16.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomCardStyle(
                                  width: 160.w,
                                  height: 40.h,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.w),
                                  child: Row(
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
                                          size: 20.sp,
                                          color: greyClr,
                                        ),
                                      ),
                                      Text(_quantity.toString(),
                                          style: Get.textTheme.titleSmall),
                                      InkWell(
                                        onTap: () {
                                          if (widget.products.alertQuantity !=
                                              _quantity) {
                                            setState(() {
                                              _quantity++;
                                            });
                                          }
                                        },
                                        child: Icon(
                                          Icons.add,
                                          size: 20.sp,
                                          color: greyClr,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                CustomCardStyle(
                                  width: 160.w,
                                  height: 40.h,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.w),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 20.sp,
                                        color: productRating < 4.5
                                            ? greyClr
                                            : yellowClr,
                                      ),
                                      Gap(4.w),
                                      Text(
                                        productRating.toString(),
                                        style: Get.textTheme.titleSmall,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Gap(16.h),
                            Text(
                              'Details',
                              style: Get.textTheme.titleMedium,
                            ),
                            Gap(8.h),
                            Text(
                                _isExpanded == true
                                    ? '${widget.products.longDesc}'
                                    : '${widget.products.shortDesc}',
                                style: Get.textTheme.bodyMedium),
                            Gap(8.h),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isExpanded = !_isExpanded;
                                });
                              },
                              child: Text(
                                  _isExpanded ? 'Show Less' : 'Show More',
                                  style: Get.textTheme.bodyMedium!
                                      .copyWith(color: orangeClr)),
                            ),
                            Gap(16.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Promotional Code',
                                    style: Get.textTheme.titleLarge),
                                GestureDetector(
                                  onTap: () {
                                    Get.bottomSheet(
                                      CustomBottomSheet(children: [
                                        Text('Your Promotional Code',
                                            style: Get.textTheme.titleLarge),
                                        Gap(16.h),
                                        const CustomCouponCode(),
                                        Gap(8.h),
                                        const CustomCouponCode(),
                                        Gap(8.h),
                                        const CustomCouponCode(),
                                        Gap(8.h),
                                        const CustomCouponCode(),
                                        Gap(8.h),
                                        const CustomCouponCode(),
                                        Gap(16.h),
                                      ]),
                                    );
                                  },
                                  child: Text('See all',
                                      style: Get.textTheme.bodyMedium),
                                ),
                              ],
                            ),
                            Gap(8.h),
                            const CustomCouponCode(),
                            Gap(16.h),
                            Text(
                              'Reviews',
                              style: Get.textTheme.titleMedium,
                            ),
                            Gap(8.h),
                            InkWell(
                              onTap: () {
                                Get.to(() => const ReviewScreen());
                              },
                              child: Text(
                                'Write your review',
                                style: myStyle(
                                    20.sp, FontWeight.normal, orangeClr),
                              ),
                            ),
                            Gap(30.h),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(child: Gap(16.h))
                  ],
                ),
              ),
              Container(
                height: 92.h,
                width: double.infinity.w,
                decoration: BoxDecoration(
                  color: whiteClr,
                  boxShadow: [
                    BoxShadow(
                      color: blackClr.withOpacity(0.2),
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
                            style: Get.textTheme.bodySmall!
                                .copyWith(color: greyClr),
                          ),
                          Text(
                            '$takaSign${calculateTotal()}',
                            style: Get.textTheme.titleMedium!
                                .copyWith(color: orangeClr),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => const StorePage());
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.store,
                            size: 30.sp,
                            color: orangeClr,
                          ),
                          Text(
                            'Store',
                            style: Get.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        customSuccessMessage(message: 'Add to cart Successful');
                        Get.to(() => HomeScreen());
                      },
                      focusColor: whiteClr,
                      child: Container(
                        width: 146.w,
                        height: 50.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r),
                            color: orangeClr),
                        child: Text(
                          'Add to cart',
                          style: Get.textTheme.titleMedium!
                              .copyWith(color: whiteClr),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int calculateTotal() {
    int total = 0;
    total += widget.products.offerPrice! * _quantity;
    return total;
  }
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
