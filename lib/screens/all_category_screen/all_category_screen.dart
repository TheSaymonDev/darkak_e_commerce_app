import 'package:cached_network_image/cached_network_image.dart';
import 'package:darkak_e_commerce_app/screens/all_category_screen/controllers/category_wised_product_list_controller.dart';
import 'package:darkak_e_commerce_app/screens/shop_screen/models/product_model.dart';
import 'package:darkak_e_commerce_app/screens/wishlist_screen/controllers/add_to_wishList_controller.dart';
import 'package:darkak_e_commerce_app/screens/wishlist_screen/controllers/wishlist_item_controller.dart';
import 'package:darkak_e_commerce_app/screens/wishlist_screen/models/add_to_wishlist_model.dart';
import 'package:darkak_e_commerce_app/utils/app_colors.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class AllCategoryScreen extends StatefulWidget {
  const AllCategoryScreen({super.key});

  @override
  State<AllCategoryScreen> createState() => _AllCategoryScreenState();
}

class _AllCategoryScreenState extends State<AllCategoryScreen> {
  final _wishListItemController = Get.find<WishListItemController>();

  final _allCategoryController = Get.find<CategoryWisedProductListController>();

  int _currentIndex = 0;
  // @override
  // void initState() {
  //   super.initState();
  //   Get.find<CategoryWisedProductListController>()
  //       .getFilterProductByCategory(_allCategoryController.categoryData[0].id!);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarTextviewWithBack(
          onPressedBack: () {
            Get.back();
          },
          title: 'Category'),
      body: SizedBox(
        height: double.infinity.h,
        width: double.infinity.w,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: double.infinity.h,
              width: 118.w,
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    final category = _allCategoryController.categoryData[index];
                    return InkWell(
                      onTap: () {
                        setState(
                          () {
                            _currentIndex = index;
                            Get.find<CategoryWisedProductListController>()
                                .getFilterProductByCategory(category.id!);
                          },
                        );
                      },
                      child: Container(
                        height: 95.h,
                        width: 118.w,
                        color: _currentIndex == index
                            ? whiteClr
                            : greyClr.withValues(alpha: 0.2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomCard(
                              isCircle: true,
                              height: 26.h,
                              width: 26.w,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4.w, vertical: 4.h),
                              child: category.image != null
                                  ? CachedNetworkImage(
                                      imageUrl:
                                          '${AppUrls.imgUrl}${category.image!.path}',
                                      placeholder: (context, url) =>
                                          const CircularProgressIndicator(), // Optional: Loading indicator
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons
                                              .error), // Optional: Error icon
                                    )
                                  : const Icon(Icons.image_not_supported),
                            ),
                            Gap(4.h),
                            Text(
                              '${category.name}',
                              style: Get.textTheme.bodySmall!
                                  .copyWith(color: greyClr),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Gap(0.h),
                  itemCount: _allCategoryController.categoryData.length),
            ),
            GetBuilder<CategoryWisedProductListController>(
                builder: (controller) {
              return Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.w,
                    mainAxisSpacing: 8.h,
                  ),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final cProduct = controller.productList[index];
                    return InkWell(
                      borderRadius: BorderRadius.circular(8.r),
                      onTap: () {
                        // Get.to(() => ProductDetailsScreen(product: cProduct));
                      },
                      child: CustomCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Stack(
                                children: [
                                  Container(
                                    width: double.infinity.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.r),
                                      image: DecorationImage(
                                        image: cProduct.images != null &&
                                                cProduct.images!.isNotEmpty
                                            ? CachedNetworkImageProvider(
                                                '${AppUrls.imgUrl}${cProduct.images![0].path}')
                                            : const AssetImage(
                                                    'assets/images/placeholder.png')
                                                as ImageProvider, // Placeholder image
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  buildWishListIcon(cProduct),
                                ],
                              ),
                            ),
                            Gap(8.h),
                            Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Text(
                                '${cProduct.name}',
                                style: Get.textTheme.titleSmall,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Gap(4.h),
                            Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Text(
                                  '${AppUrls.takaSign}${cProduct.offerPrice}',
                                  style: Get.textTheme.bodySmall),
                            ),
                            Gap(8.h),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: controller.productList.length,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Positioned buildWishListIcon(ProductModel cProduct) {
    return Positioned(
        right: 0,
        child: InkWell(
            onTap: () async {
              if (_wishListItemController.isInWishlist(cProduct.id!)) {
                _wishListItemController.removeWishListItem(cProduct.id!);
              } else {
                Get.find<AddToWishlistController>().addToWishlist(
                    addToWishlistData:
                        AddToWishlistModel(productId: cProduct.id!));
              }
            },
            child: Container(
              margin: EdgeInsets.only(top: 8.h, right: 8.w),
              height: 24.h,
              width: 24.w,
              alignment: Alignment.center,
              decoration:
                  const BoxDecoration(shape: BoxShape.circle, color: whiteClr),
              child: GetBuilder<WishListItemController>(builder: (controller) {
                return Icon(
                    controller.isInWishlist(cProduct.id!)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    size: 18.sp,
                    color: controller.isInWishlist(cProduct.id!)
                        ? orangeClr
                        : greyClr);
              }),
            )));
  }
}
