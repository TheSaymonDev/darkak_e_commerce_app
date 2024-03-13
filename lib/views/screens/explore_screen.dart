import 'package:darkak_e_commerce_app/controllers/explore_screen_controller.dart';
import 'package:darkak_e_commerce_app/controllers/productList_controller.dart';
import 'package:darkak_e_commerce_app/core/app_data.dart';
import 'package:darkak_e_commerce_app/models/demo_product_list.dart';
import 'package:darkak_e_commerce_app/views/widgets/explore_screen_widgets/product_list.dart';
import 'package:darkak_e_commerce_app/views/widgets/explore_screen_widgets/product_sector_title.dart';
import 'package:darkak_e_commerce_app/views/screens/see_all_categories_screen.dart';
import 'package:darkak_e_commerce_app/views/widgets/explore_screen_widgets/brand_shop.dart';
import 'package:darkak_e_commerce_app/views/screens/notification_screen.dart';
import 'package:darkak_e_commerce_app/views/screens/product_listing_screen.dart';
import 'package:darkak_e_commerce_app/views/screens/search_screen.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_search_text_form_field.dart';
import 'package:darkak_e_commerce_app/views/widgets/explore_screen_widgets/count_down_timer.dart';
import 'package:darkak_e_commerce_app/views/widgets/explore_screen_widgets/product_categories.dart';
import 'package:darkak_e_commerce_app/views/widgets/explore_screen_widgets/slider_with_indicator.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({super.key});

 final ExploreScreenController _exploreScreenController = Get.put(ExploreScreenController());

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
              leading: Icon(
                Icons.location_on,
                size: 20.sp,
                color: orangeClr,
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Location',
                    style: Get.textTheme.bodyMedium,
                  ),
                  Text(
                    'Dhaka North, Banani Road No. 12 - 19',
                    style: Get.textTheme.bodySmall!.copyWith(color: greyClr),
                  ),
                ],
              ),
              actions: [
                if (controller.showSearchIcon)
                  IconButton(
                    onPressed: () {
                      Get.to(() => const SearchPage());
                    },
                    icon: Icon(
                      Icons.search,
                      size: 25.sp,
                      color: orangeClr,
                    ),
                  ),
                IconButton(
                  onPressed: () {
                    Get.to(() => const NotificationScreen());
                  },
                  icon: Icon(
                    Icons.notification_add,
                    size: 25.sp,
                    color: orangeClr,
                  ),
                ),
                //show another search icon
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: CustomSearchTextFormField(
                    onTap: () {
                      Get.to(() => const SearchPage());
                    },
                    readOnly: true,
                  ),
                ),
              ),
            );
          }),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  Gap(16.h),
                  const SliderWithIndicator(),
                  Gap(16.h),
                  ProductSectorTitle(
                      onTap: () {
                        Get.to(const SeeAllCategoriesScreen());
                      },
                      title: 'Categories'),
                  Gap(8.h),
                  const ProductCategories(),
                  Gap(16.h),
                  GetBuilder<ExploreScreenController>(builder: (controller) {
                    return CountDownTimer(duration: controller.duration);
                  }),
                  Gap(16.h),
                  GetBuilder<ProductListController>(
                    builder: (controller) {
                      return controller.isLoading? customCircularProgressIndicator: ProductList(productList: controller.products);
                    }
                  ),
                  Gap(16.h),
                  ProductSectorTitle(
                      onTap: () {
                        Get.to(() =>
                            ProductListingScreen(productList: demoProductList));
                      },
                      title: 'Best Selling'),
                  Gap(8.h),
                  GetBuilder<ProductListController>(
                      builder: (controller) {
                        return controller.isLoading? customCircularProgressIndicator: ProductList(productList: controller.products);
                      }
                  ),
                  Gap(16.h),
                  ProductSectorTitle(
                      onTap: () {}, title: 'Featured Brands'),
                  Gap(8.h),
                  const BrandShop(),
                  Gap(16.h),
                  ProductSectorTitle(
                      onTap: () {
                        Get.to(() =>
                            ProductListingScreen(productList: demoProductList));
                      },
                      title: 'New Arrival'),
                  Gap(8.h),
                  GetBuilder<ProductListController>(
                      builder: (controller) {
                        return controller.isLoading? customCircularProgressIndicator: ProductList(productList: controller.products);
                      }
                  ),
                  Gap(16.h),
                  ProductSectorTitle(
                      onTap: () {
                        Get.to(() =>
                            ProductListingScreen(productList: demoProductList));
                      },
                      title: 'Just For You'),
                  Gap(8.h),
                  GetBuilder<ProductListController>(
                      builder: (controller) {
                        return controller.isLoading? customCircularProgressIndicator: ProductList(productList: controller.products);
                      }
                  ),
                  Gap(16.h),
                  ProductSectorTitle(
                      onTap: () {
                        Get.to(() =>
                            ProductListingScreen(productList: demoProductList));
                      },
                      title: 'Top Trending(Week)'),
                  Gap(8.h),
                  GetBuilder<ProductListController>(
                      builder: (controller) {
                        return controller.isLoading? customCircularProgressIndicator: ProductList(productList: controller.products);
                      }
                  ),
                  Gap(16.h),
                  ProductSectorTitle(
                      onTap: () {
                        Get.to(() =>
                            ProductListingScreen(productList: demoProductList));
                      },
                      title: 'Recent Added Products'),
                  Gap(8.h),
                  GetBuilder<ProductListController>(
                      builder: (controller) {
                        return controller.isLoading? customCircularProgressIndicator: ProductList(productList: controller.products);
                      }
                  ),
                  Gap(16.h),
                ],
              ),
            ),
          )
        ],
      );
  }

}
