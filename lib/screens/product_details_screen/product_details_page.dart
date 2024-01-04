import 'package:darkak_e_commerce_app/models/product_review_model.dart';
import 'package:darkak_e_commerce_app/reusable/colors.dart';
import 'package:darkak_e_commerce_app/reusable/styles.dart';
import 'package:darkak_e_commerce_app/reusable/utility.dart';
import 'package:darkak_e_commerce_app/screens/bottom_nav_bar_screens/bottom_nav_bar_page.dart';
import 'package:darkak_e_commerce_app/screens/review_screen/review_page.dart';
import 'package:darkak_e_commerce_app/screens/store_screen/store_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage(
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
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int _selectedColor = 0;
  final double _height = 400.h;
  bool _isExpanded = false;
  int _quantity = 1;
  String _productSize = 'S';

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
                child: CustomScrollView(
                  slivers: [
                    SliverPersistentHeader(
                      pinned: true,
                      floating: true,
                      delegate: _SliverAppBarDelegate(
                        minHeight: 200.h,
                        maxHeight: _height,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(widget.productImagePath),
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
                                          separatorBuilder: (context, index) =>
                                              Gap(8.w),
                                          itemCount: widget.imagesPath.length),
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
                                    widget.productName,
                                    style: myTextStyle(
                                        25.sp, FontWeight.bold, textColor),
                                  ),
                                ),
                                Text(
                                  widget.productId,
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
                                _circularContainer(
                                  Row(
                                    children: [
                                      Text(
                                        'Color:',
                                        style: myTextStyle(15.sp,
                                            FontWeight.normal, textColor),
                                      ),
                                      const Spacer(),
                                      Text(
                                        widget.color[_selectedColor],
                                        style: myTextStyle(
                                            15.sp, FontWeight.bold, textColor),
                                      ),
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
                                          size: 20.sp,
                                          color: greyColor,
                                        ),
                                      ),
                                      Text(
                                        _quantity.toString(),
                                        style: myTextStyle(
                                            15.sp, FontWeight.bold, textColor),
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
                                          color: greyColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                _circularContainer(
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 20.sp,
                                        color: widget.productRating < 4.5
                                            ? greyColor
                                            : yellowColor,
                                      ),
                                      Gap(4.w),
                                      Text(
                                        widget.productRating.toString(),
                                        style: myTextStyle(
                                            15.sp, FontWeight.bold, textColor),
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
                            Text(
                              _isExpanded == true
                                  ? widget.productDescription.substring(
                                      0, widget.productDescription.length)
                                  : widget.productDescription.substring(0, 100),
                              style: myTextStyle(
                                  20.sp, FontWeight.normal, textColor),
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
                                style: myTextStyle(
                                    20.sp, FontWeight.normal, orangeColor),
                              ),
                            ),
                            Gap(16.h),
                            Text(
                              'Reviews',
                              style: myTextStyle(
                                  20.sp, FontWeight.bold, textColor),
                            ),
                            Gap(8.h),
                            InkWell(
                              onTap: () {
                                Get.to(()=>const ReviewPage());
                              },
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
                                                  'assets/images/liked-icon.svg',
                                                  fit: BoxFit.cover,
                                                  colorFilter:
                                                      productReview.isLiked ==
                                                              true
                                                          ? ColorFilter.mode(
                                                              greyColor,
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
                            '$takaSign${calculateTotal()}',
                            style: myTextStyle(
                                20.sp, FontWeight.bold, orangeColor),
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
                      onTap: () {
                        customSnackMessage(title: 'Add to cart', subTitle: 'Successfully');
                        Get.to(()=>const BottomNavBarPage());
                      },
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

  Container _circularContainer(Widget child) {
    return Container(
      height: 40.h,
      width: 160.w,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: shadowDecoration1(),
      child: child,
    );
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
