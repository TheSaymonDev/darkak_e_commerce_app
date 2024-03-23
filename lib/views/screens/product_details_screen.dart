import 'package:darkak_e_commerce_app/core/utils/colors.dart';
import 'package:darkak_e_commerce_app/core/utils/urls.dart';
import 'package:darkak_e_commerce_app/models/product_review_model.dart';
import 'package:darkak_e_commerce_app/views/widgets/common_widgets/custom_bottom_sheet.dart';
import 'package:darkak_e_commerce_app/views/widgets/common_widgets/custom_card_style.dart';
import 'package:darkak_e_commerce_app/views/widgets/product_details_screen_widgets/custom_coupon_code.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:darkak_e_commerce_app/views/screens/home_screen.dart';
import 'package:darkak_e_commerce_app/views/screens/review_screen.dart';
import 'package:darkak_e_commerce_app/views/screens/store_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen(
      {super.key,
      required this.productImagePath,
      required this.productName,
      required this.productPrice,
      required this.productDiscount,
      required this.productRating,
      required this.attributes,
      required this.customerReviews,
      required this.color,
      required this.imagesPath,
      required this.productDescription,
      required this.productId});

  final String productId, productImagePath, productName, productDescription;
  final int productPrice, productDiscount;
  final double productRating;
  final List<String> imagesPath; // List of image URLs
  final List<String> color;
  final List<String> attributes;
  final List<ProductReviewModel> customerReviews;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _selectedColor = 0;
  final double _height = 400.h;
  bool _isExpanded = false;
  int _quantity = 1;
  String _productSize = 'S';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteClr,
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
                            // Get.to(() => ProductViewPage(
                            //       imagePath: widget.productImagePath,
                            //       imagesPath: widget.imagesPath,
                            //     ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(widget.productImagePath),
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
                                                      _selectedColor = index;
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
                                                          image: AssetImage(
                                                            widget.imagesPath[
                                                                index],
                                                          ),
                                                          fit: BoxFit.cover),
                                                    ),
                                                  ),
                                                ),
                                            separatorBuilder:
                                                (context, index) => Gap(8.w),
                                            itemCount:
                                                widget.imagesPath.length),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    widget.productName,
                                    style: myStyle(
                                        25.sp, FontWeight.bold, blackClr),
                                  ),
                                ),
                                Text(
                                  widget.productId,
                                  style:
                                      myStyle(25.sp, FontWeight.bold, blackClr),
                                ),
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
                                    children: [
                                      Text(
                                        'Size:',
                                        style: myStyle(
                                            15.sp, FontWeight.normal, blackClr),
                                      ),
                                      const Spacer(),
                                      DropdownButton(
                                        underline: const SizedBox(
                                          height: 0,
                                        ),
                                        style: myStyle(
                                            15.sp, FontWeight.bold, blackClr),
                                        items: widget.attributes
                                            .map((String item) {
                                          return DropdownMenuItem(
                                            value: item,
                                            child: Text(item),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          if (newValue != null) {
                                            setState(() {
                                              _productSize = newValue;
                                            });
                                          }
                                        },
                                        value: _productSize,
                                      ),
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
                                      Text(
                                        widget.color[_selectedColor],
                                        style: myStyle(
                                            15.sp, FontWeight.bold, blackClr),
                                      ),
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
                                      Text(
                                        _quantity.toString(),
                                        style: myStyle(
                                            15.sp, FontWeight.bold, blackClr),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            _quantity++;
                                          });
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
                                        color: widget.productRating < 4.5
                                            ? greyClr
                                            : yellowClr,
                                      ),
                                      Gap(4.w),
                                      Text(
                                        widget.productRating.toString(),
                                        style: myStyle(
                                            15.sp, FontWeight.bold, blackClr),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Gap(16.h),
                            Text(
                              'Details',
                              style: myStyle(20.sp, FontWeight.bold, blackClr),
                            ),
                            Gap(8.h),
                            Text(
                              _isExpanded == true
                                  ? widget.productDescription.substring(
                                      0, widget.productDescription.length)
                                  : widget.productDescription.substring(0, 100),
                              style:
                                  myStyle(20.sp, FontWeight.normal, blackClr),
                            ),
                            Gap(8.h),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isExpanded = !_isExpanded;
                                });
                              },
                              child: Text(
                                _isExpanded ? 'Show Less' : 'Show More',
                                style: myStyle(
                                    20.sp, FontWeight.normal, orangeClr),
                              ),
                            ),
                            Gap(16.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Promotional Code',
                                  style:
                                      myStyle(25.sp, FontWeight.bold, blackClr),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.bottomSheet(
                                      CustomBottomSheet(children: [
                                        Text(
                                          'Your Promotional Code',
                                          style: myStyle(
                                              25.sp, FontWeight.bold, blackClr),
                                        ),
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
                                  child: Text(
                                    'See all',
                                    style: myStyle(
                                        20.sp, FontWeight.normal, blackClr),
                                  ),
                                ),
                              ],
                            ),
                            Gap(8.h),
                            const CustomCouponCode(),
                            Gap(16.h),
                            Text(
                              'Reviews',
                              style: myStyle(20.sp, FontWeight.bold, blackClr),
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
                    SliverList.separated(
                      itemBuilder: (context, index) {
                        final productReview = widget.customerReviews[index];
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
                                  backgroundColor: orangeClr,
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
                                          style: myStyle(
                                              20.sp, FontWeight.bold, blackClr),
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              size: 25.sp,
                                              color: yellowClr,
                                            ),
                                            Text(
                                              productReview.rating.toString(),
                                              style: myStyle(20.sp,
                                                  FontWeight.normal, blackClr),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Gap(8.h),
                                    Text(
                                      productReview.message,
                                      style: myStyle(
                                          15.sp, FontWeight.normal, blackClr),
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
                                              style: myStyle(20.sp,
                                                  FontWeight.normal, blackClr),
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
                                                  'assets/images/liked-icon.svg',
                                                  fit: BoxFit.cover,
                                                  colorFilter:
                                                      productReview.isLiked ==
                                                              true
                                                          ? ColorFilter.mode(
                                                              greyClr,
                                                              BlendMode.srcIn)
                                                          : null,
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
                      itemCount: widget.customerReviews.length,
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
                            style: myStyle(15.sp, FontWeight.normal, greyClr),
                          ),
                          Text(
                            '${Urls.takaSign}${calculateTotal()}',
                            style: myStyle(20.sp, FontWeight.bold, orangeClr),
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
                            style: myStyle(20.sp, FontWeight.normal, blackClr),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        customSnackMessage(title: 'Add to cart Successful');
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
                          style: myStyle(20.sp, FontWeight.bold, whiteClr),
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
    total += widget.productPrice * _quantity;
    return total;
  }

  // Widget buildSizeDropdown(List<String> sizes) {
  //   String selectedSize = sizes.isNotEmpty ? sizes[0] : '';
  //
  //   return DropdownButton<String>(
  //
  //     value: selectedSize,
  //     onChanged: (String? newSize) {
  //       if (newSize != null) {
  //         setState(() {
  //           selectedSize=newSize;
  //         });
  //         // Handle the selected size
  //         print('Selected Size: $newSize');
  //       }
  //     },
  //     items: sizes.map((String size) {
  //       return DropdownMenuItem<String>(
  //         value: size,
  //         child: Text(size),
  //       );
  //     }).toList(),
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
