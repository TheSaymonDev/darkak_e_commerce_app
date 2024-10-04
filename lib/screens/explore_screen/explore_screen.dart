import 'package:cached_network_image/cached_network_image.dart';
import 'package:darkak_e_commerce_app/routes/app_routes.dart';
import 'package:darkak_e_commerce_app/screens/explore_screen/controllers/brand_list_controller.dart';
import 'package:darkak_e_commerce_app/screens/explore_screen/controllers/category_list_controller.dart';
import 'package:darkak_e_commerce_app/screens/explore_screen/controllers/explore_screen_controller.dart';
import 'package:darkak_e_commerce_app/screens/shop_screen/controllers/product_list_controller.dart';
import 'package:darkak_e_commerce_app/services/shared_preferences_service.dart';
import 'package:darkak_e_commerce_app/utils/app_colors.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_card.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_product_card.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_search_text_form_field.dart';
import 'package:darkak_e_commerce_app/widgets/explore_screen_widgets/horizontal_shimmer_list.dart';
import 'package:darkak_e_commerce_app/widgets/explore_screen_widgets/product_sector_title.dart';
import 'package:darkak_e_commerce_app/screens/notification_screen/notification_screen.dart';
import 'package:darkak_e_commerce_app/widgets/explore_screen_widgets/count_down_timer.dart';
import 'package:darkak_e_commerce_app/widgets/explore_screen_widgets/slider_with_indicator.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({super.key});

  final _exploreScreenController = Get.find<ExploreScreenController>();
  final _productListController = Get.find<ProductListController>();
  final _categoryListController = Get.find<CategoryListController>();
  final _brandListController = Get.find<BrandListController>();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        controller: _exploreScreenController.scrollController,
        slivers: [
          GetBuilder<ExploreScreenController>(builder: (controller) {
            return SliverAppBar(
                backgroundColor: Colors.white,
                expandedHeight: 130.h,
                pinned: true,
                leading: Icon(Icons.location_on, size: 20.sp, color: orangeClr),
                title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Location', style: Get.textTheme.bodyMedium),
                      Text(SharedPreferencesService().getLocation(),
                          style: Get.textTheme.bodySmall!
                              .copyWith(color: greyClr)),
                    ]),
                actions: [
                  if (controller.showSearchIcon)
                    IconButton(
                        onPressed: () {
                          //Get.to(() => const SearchProductScreen());
                        },
                        icon:
                            Icon(Icons.search, size: 25.sp, color: orangeClr)),
                  IconButton(
                      onPressed: () {
                        Get.to(() => const NotificationScreen());
                      },
                      icon: Icon(Icons.notification_add,
                          size: 25.sp, color: orangeClr))
                  //show another search icon
                ],
                flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                        alignment: Alignment.bottomCenter,
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: CustomSearchTextFormField(
                            onTap: () {
                              //Get.to(() => const SearchProductScreen());
                            },
                            readOnly: true))));
          }),
          SliverToBoxAdapter(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(children: [
                    Gap(16.h),
                    const SliderWithIndicator(),
                    Gap(16.h),
                    ProductSectorTitle(
                        onTap: () {
                          Get.toNamed(AppRoutes.allCategoryScreen, arguments: {
                            'categoryData': _categoryListController.categories
                          });
                        },
                        title: 'Categories'),
                    Gap(8.h),
                    GetBuilder<CategoryListController>(
                        builder: (controller) => controller.isLoading
                            ? customCircularProgressIndicator
                            : _buildCategoryList(controller)),
                    Gap(16.h),
                    GetBuilder<ExploreScreenController>(builder: (controller) {
                      return CountDownTimer(duration: controller.duration);
                    }),
                    Gap(16.h),
                    GetBuilder<ProductListController>(builder: (controller) {
                      return controller.isLoading == true
                          ? const HorizontalShimmerList()
                          : _buildHorizontalProductList(controller);
                    }),
                    Gap(16.h),
                    ProductSectorTitle(
                        onTap: () {
                          Get.toNamed(AppRoutes.productListingScreen,
                              arguments: {
                                'productListData':
                                    _productListController.productsData
                              });
                        },
                        title: 'Best Selling'),
                    Gap(8.h),
                    GetBuilder<ProductListController>(builder: (controller) {
                      return controller.isLoading == true
                          ? const HorizontalShimmerList()
                          : _buildHorizontalProductList(controller);
                    }),
                    Gap(16.h),
                    ProductSectorTitle(
                        onTap: () {
                          Get.toNamed(AppRoutes.allBrandScreen, arguments: {
                            'brandListData': _brandListController.brandsData
                          });
                        },
                        title: 'Featured Brands'),
                    Gap(8.h),
                    GetBuilder<BrandListController>(builder: (controller) {
                      return controller.isLoading == true
                          ? customCircularProgressIndicator
                          : _buildBrandList(controller);
                    }),
                    Gap(16.h),
                    ProductSectorTitle(
                        onTap: () {
                          Get.toNamed(AppRoutes.productListingScreen,
                              arguments: {
                                'productListData':
                                    _productListController.productsData
                              });
                        },
                        title: 'New Arrival'),
                    Gap(8.h),
                    GetBuilder<ProductListController>(builder: (controller) {
                      return controller.isLoading == true
                          ? const HorizontalShimmerList()
                          : _buildHorizontalProductList(controller);
                    }),
                    Gap(16.h),
                    ProductSectorTitle(
                        onTap: () {
                          Get.toNamed(AppRoutes.productListingScreen,
                              arguments: {
                                'productListData':
                                    _productListController.productsData
                              });
                        },
                        title: 'Just For You'),
                    Gap(8.h),
                    GetBuilder<ProductListController>(builder: (controller) {
                      return controller.isLoading == true
                          ? const HorizontalShimmerList()
                          : _buildHorizontalProductList(controller);
                    }),
                    Gap(16.h),
                    ProductSectorTitle(
                        onTap: () {
                          Get.toNamed(AppRoutes.productListingScreen,
                              arguments: {
                                'productListData':
                                    _productListController.productsData
                              });
                        },
                        title: 'Top Trending(Week)'),
                    Gap(8.h),
                    GetBuilder<ProductListController>(builder: (controller) {
                      return controller.isLoading == true
                          ? const HorizontalShimmerList()
                          : _buildHorizontalProductList(controller);
                    }),
                    Gap(16.h),
                    ProductSectorTitle(
                        onTap: () {
                          Get.toNamed(AppRoutes.productListingScreen,
                              arguments: {
                                'productListData':
                                    _productListController.productsData
                              });
                        },
                        title: 'Recent Added Products'),
                    Gap(8.h),
                    GetBuilder<ProductListController>(builder: (controller) {
                      return controller.isLoading == true
                          ? const HorizontalShimmerList()
                          : _buildHorizontalProductList(controller);
                    }),
                    Gap(16.h)
                  ])))
        ]);
  }

  SizedBox _buildBrandList(BrandListController controller) {
    return SizedBox(
      height: 80.h,
      width: double.infinity.w,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final brand = controller.brandsData[index];
            return GestureDetector(
              onTap: () {
                _brandListController.getFilterProductByBrand(brand.id!);
                Get.toNamed(AppRoutes.productListingScreen,
                    arguments: {
                      'productListData':
                      _brandListController.productListData
                    });
              },
              child: CustomCard(
                  width: 180.w,
                  height: double.infinity.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40.h,
                        width: 40.w,
                        child: brand.image != null
                            ? CachedNetworkImage(
                                imageUrl:
                                    '${AppUrls.imgUrl}${brand.image!.path}',
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(), // Optional: Loading indicator
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                        Icons.error), // Optional: Error icon
                              )
                            : const Icon(Icons.image_not_supported),
                      ),
                      Gap(26.w),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            brand.name ?? '',
                            style: Get.textTheme.titleLarge,
                          ),
                          Text('120 Products',
                              style: Get.textTheme.bodySmall!
                                  .copyWith(color: greyClr)),
                        ],
                      ),
                    ],
                  )),
            );
          },
          separatorBuilder: (context, index) => Gap(16.w),
          itemCount: controller.brandsData.length),
    );
  }

  SizedBox _buildCategoryList(CategoryListController controller) {
    return SizedBox(
      height: 95.h,
      width: double.infinity,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final category = controller.categories[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(50.r),
                  onTap: () {
                    _categoryListController.getFilterProductByCategory(category.id!);
                    Get.toNamed(AppRoutes.productListingScreen,
                        arguments: {
                          'productListData':
                          _categoryListController.productListData
                        });
                  },
                  child: CustomCard(
                    isCircle: true,
                    width: 60.w,
                    height: 60.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                    child: category.image != null
                        ? CachedNetworkImage(
                            imageUrl:
                                '${AppUrls.imgUrl}${category.image!.path}',
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(), // Optional: Loading indicator
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error), // Optional: Error icon
                          )
                        : const Icon(Icons
                            .image_not_supported), // Default placeholder for null images
                  ),
                ),
                Text(
                  category.name ?? '',
                  style: Get.textTheme.bodyMedium,
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => Gap(24.w),
          itemCount: controller.categories.length),
    );
  }

  SizedBox _buildHorizontalProductList(ProductListController controller) {
    return SizedBox(
      height: 324.h,
      width: double.infinity.w,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CustomProductCard(product: controller.productsData[index]);
          },
          separatorBuilder: (context, index) => Gap(16.w),
          itemCount: controller.productsData.length),
    );
  }
}
