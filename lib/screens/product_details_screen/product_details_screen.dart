import 'package:darkak_e_commerce_app/routes/app_routes.dart';
import 'package:darkak_e_commerce_app/screens/product_details_screen/controllers/add_to_cart_controller.dart';
import 'package:darkak_e_commerce_app/screens/product_details_screen/controllers/product_details_controller.dart';
import 'package:darkak_e_commerce_app/screens/product_details_screen/model/add_to_cart_model.dart';
import 'package:darkak_e_commerce_app/screens/wishlist_screen/controllers/add_to_wishList_controller.dart';
import 'package:darkak_e_commerce_app/screens/wishlist_screen/controllers/wishlist_item_controller.dart';
import 'package:darkak_e_commerce_app/screens/wishlist_screen/models/add_to_wishlist_model.dart';
import 'package:darkak_e_commerce_app/services/shared_preferences_service.dart';
import 'package:darkak_e_commerce_app/utils/app_colors.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_bottom_sheet.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_card.dart';
import 'package:darkak_e_commerce_app/widgets/product_details_screen_widgets/custom_coupon_code.dart';
import 'package:darkak_e_commerce_app/widgets/product_details_screen_widgets/custom_drop_down.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key});

  final double _height = 400.h;

  final double productRating = 4.5;

  final _productDetailsController = Get.find<ProductDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SizedBox(
                height: double.infinity.h,
                width: double.infinity.w,
                child: Column(children: [
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        SliverPersistentHeader(
                            pinned: true,
                            floating: true,
                            delegate: _buildSliverAppBarDelegate),
                        SliverToBoxAdapter(
                            child: Container(
                                margin: EdgeInsets.only(top: 16.h),
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              '${_productDetailsController.product.name}',
                                              style: Get.textTheme.titleLarge),
                                          GetBuilder<WishListItemController>(
                                              builder: (controller) {
                                            return InkWell(
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                                onTap: () async {
                                                  String token =
                                                      SharedPreferencesService()
                                                          .getToken();
                                                  if (token.isNotEmpty) {
                                                    if (controller.isInWishlist(
                                                        _productDetailsController
                                                            .product.id!)) {
                                                      controller.removeWishListItem(
                                                          _productDetailsController
                                                              .product.id!);
                                                    } else {
                                                      Get.find<
                                                              AddToWishlistController>()
                                                          .addToWishlist(
                                                              addToWishlistData:
                                                                  AddToWishlistModel(
                                                                      productId: _productDetailsController
                                                                          .product
                                                                          .id!));
                                                    }
                                                  } else {
                                                    Get.offAllNamed(
                                                        AppRoutes.signInScreen);
                                                  }
                                                },
                                                child: Icon(
                                                    controller.isInWishlist(
                                                            _productDetailsController
                                                                .product.id!)
                                                        ? Icons.favorite
                                                        : Icons.favorite_border,
                                                    size: 24.sp,
                                                    color: controller.isInWishlist(
                                                            _productDetailsController
                                                                .product.id!)
                                                        ? orangeClr
                                                        : greyClr));
                                          }),
                                        ],
                                      ),
                                      Gap(16.h),
                                      buildProductAttributes,
                                      Gap(16.h),
                                      buildProductDescription,
                                      Gap(16.h),
                                      buildPromotionalCodeSection,
                                      Gap(16.h),
                                      Text(
                                        'Reviews',
                                        style: Get.textTheme.titleMedium,
                                      ),
                                      Gap(8.h),
                                      InkWell(
                                          onTap: () {
                                            Get.toNamed(AppRoutes.reviewScreen);
                                          },
                                          child: Text('Write your review',
                                              style: Get.textTheme.bodyMedium!
                                                  .copyWith(color: orangeClr))),
                                      Gap(30.h)
                                    ]))),
                        SliverToBoxAdapter(child: Gap(16.h))
                      ],
                    ),
                  ),
                  Container(
                      height: 92.h,
                      width: double.infinity.w,
                      decoration: BoxDecoration(color: whiteClr, boxShadow: [
                        BoxShadow(
                            color: blackClr.withValues(alpha: 0.2),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, -3) // Offset for top shadow
                            )
                      ]),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                                onTap: () {},
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Price',
                                          style: Get.textTheme.bodySmall!
                                              .copyWith(color: greyClr)),
                                      GetBuilder<ProductDetailsController>(
                                          builder: (controller) {
                                        return Text(
                                            '${AppUrls.takaSign}${controller.calculateTotal(controller.product.offerPrice!)}',
                                            style: Get.textTheme.titleMedium!
                                                .copyWith(color: orangeClr));
                                      })
                                    ])),
                            InkWell(
                                onTap: () {
                                  //Get.to(() => const StorePage());
                                },
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.store,
                                          size: 30.sp, color: orangeClr),
                                      Text('Store',
                                          style: Get.textTheme.bodyMedium)
                                    ])),
                            GetBuilder<AddToCartController>(
                                builder: (controller) => controller.isLoading
                                    ? customCircularProgressIndicator
                                    : InkWell(
                                        onTap: () {
                                          String token =
                                              SharedPreferencesService()
                                                  .getToken();
                                          if (token.isNotEmpty) {
                                            controller.addToCart(
                                              addToCartData: AddToCartModel(
                                                  productId:
                                                      _productDetailsController
                                                          .product.id!,
                                                  size:
                                                      _productDetailsController
                                                          .selectedSize!,
                                                  color:
                                                      _productDetailsController
                                                          .selectedColor!,
                                                  quantity:
                                                      _productDetailsController
                                                          .quantity
                                                          .toString()),
                                            );
                                          } else {
                                            Get.offAllNamed(
                                                AppRoutes.signInScreen);
                                          }
                                        },
                                        focusColor: whiteClr,
                                        child: Container(
                                            width: 146.w,
                                            height: 50.h,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6.r),
                                                color: orangeClr),
                                            child: Text('Add to cart',
                                                style: Get
                                                    .textTheme.titleMedium!
                                                    .copyWith(
                                                        color: whiteClr)))))
                          ]))
                ]))));
  }

  _SliverAppBarDelegate get _buildSliverAppBarDelegate {
    return _SliverAppBarDelegate(
        minHeight: 200.h,
        maxHeight: _height,
        child: GestureDetector(onTap: () {
          Get.toNamed(AppRoutes.productViewScreen, arguments: {
            'imagePath': _productDetailsController
                .product.images![_productDetailsController.selectedImg].path,
            'imagesPath': _productDetailsController.product.images
          });
        }, child: GetBuilder<ProductDetailsController>(builder: (controller) {
          return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          '${AppUrls.imgUrl}${controller.product.images![controller.selectedImg].path}'),
                      fit: BoxFit.cover)),
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
                                    icon: Icon(Icons.keyboard_arrow_left,
                                        size: 30.sp, color: orangeClr))),
                            Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 16.h,
                                ),
                                child: Visibility(
                                    visible: constraints.maxHeight >= _height,
                                    child: buildMultipleImage))
                          ])));
        })));
  }

  Column get buildPromotionalCodeSection {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text('Promotional Code', style: Get.textTheme.titleLarge),
        GestureDetector(
            onTap: () {
              Get.bottomSheet(CustomBottomSheet(children: [
                Text('Your Promotional Code', style: Get.textTheme.titleLarge),
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
                Gap(16.h)
              ]));
            },
            child: Text('See all', style: Get.textTheme.bodyMedium))
      ]),
      Gap(8.h),
      const CustomCouponCode()
    ]);
  }

  Column get buildProductDescription {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Details', style: Get.textTheme.titleMedium),
        Gap(8.h),
        GetBuilder<ProductDetailsController>(builder: (controller) {
          return Text(
              controller.isExpanded == true
                  ? '${controller.product.longDesc}'
                  : '${controller.product.shortDesc}',
              style: Get.textTheme.bodyMedium);
        }),
        Gap(8.h),
        GetBuilder<ProductDetailsController>(builder: (controller) {
          return GestureDetector(
              onTap: () => controller.toggleDes(),
              child: Text(controller.isExpanded ? 'Show Less' : 'Show More',
                  style: Get.textTheme.bodyMedium!.copyWith(color: orangeClr)));
        })
      ],
    );
  }

  Column get buildProductAttributes {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        GetBuilder<ProductDetailsController>(builder: (controller) {
          return CustomCard(
              width: 160.w,
              height: 40.h,
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Row(children: [
                Text(
                  'Size:   ${controller.selectedSize}',
                  style: Get.textTheme.titleSmall,
                ),
                const Spacer(),
                FittedBox(
                  child: CustomDropdown(
                      items: controller.productSizes,
                      onChanged: (newValue) =>
                          controller.productSizeChange(newValue)),
                )
              ]));
        }),
        GetBuilder<ProductDetailsController>(builder: (controller) {
          return CustomCard(
              width: 160.w,
              height: 40.h,
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Row(children: [
                Text(
                  'Color:   ${controller.selectedColor}',
                  style: Get.textTheme.titleSmall,
                ),
                const Spacer(),
                FittedBox(
                  child: CustomDropdown(
                      items: controller.productColors,
                      onChanged: (newValue) =>
                          controller.productColorChange(newValue)),
                )
              ]));
        }),
      ]),
      Gap(16.h),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        CustomCard(
            width: 160.w,
            height: 40.h,
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () =>
                          _productDetailsController.decrementQuantity(),
                      child: Icon(Icons.remove, size: 20.sp, color: greyClr)),
                  GetBuilder<ProductDetailsController>(builder: (controller) {
                    return Text('${controller.quantity}',
                        style: Get.textTheme.titleSmall);
                  }),
                  InkWell(
                      onTap: () => _productDetailsController.incrementQuantity(
                          _productDetailsController.product.alertQuantity!),
                      child: Icon(Icons.add, size: 20.sp, color: greyClr))
                ])),
        CustomCard(
            width: 160.w,
            height: 40.h,
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star,
                    size: 20.sp,
                    color: productRating < 4.5 ? greyClr : yellowClr,
                  ),
                  Gap(4.w),
                  Text(
                    productRating.toString(),
                    style: Get.textTheme.titleSmall,
                  )
                ]))
      ])
    ]);
  }

  Container get buildMultipleImage {
    return Container(
        height: 100.h,
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.w),
        alignment: Alignment.center,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => GestureDetector(
                onTap: () => _productDetailsController.imageSelection(index),
                child: Container(
                    height: 80.h,
                    width: 90.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        image: DecorationImage(
                            image: NetworkImage(
                                '${AppUrls.imgUrl}${_productDetailsController.product.images![index].path}'),
                            fit: BoxFit.cover)))),
            separatorBuilder: (context, index) => Gap(8.w),
            itemCount: _productDetailsController.product.images!.length));
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
