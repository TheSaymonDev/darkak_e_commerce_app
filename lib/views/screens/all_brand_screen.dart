import 'package:cached_network_image/cached_network_image.dart';
import 'package:darkak_e_commerce_app/controllers/brand_wised_product_controller.dart';
import 'package:darkak_e_commerce_app/core/utils/colors.dart';
import 'package:darkak_e_commerce_app/core/utils/urls.dart';
import 'package:darkak_e_commerce_app/models/final_brand.dart';
import 'package:darkak_e_commerce_app/views/widgets/common_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:darkak_e_commerce_app/views/widgets/common_widgets/custom_card.dart';
import 'package:darkak_e_commerce_app/views/widgets/common_widgets/custom_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class AllBrandScreen extends StatefulWidget {
  final List<Brand> brandList;
  const AllBrandScreen({super.key, required this.brandList});

  @override
  State<AllBrandScreen> createState() => _AllBrandScreenState();
}

class _AllBrandScreenState extends State<AllBrandScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    Get.find<BrandWisedProductListController>()
        .getFilterProductByBrand(widget.brandList[0].id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarTextviewWithBack(
          onPressedBack: () {
            Get.back();
          },
          title: 'Brand'),
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(
                height: 80.h,
                width: double.infinity.w,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final brand = widget.brandList[index];
                    return InkWell(
                      onTap: () {
                        _currentIndex = index;
                        Get.find<BrandWisedProductListController>()
                            .getFilterProductByBrand(brand.id!);
                        setState(() {});
                      },
                      child: CustomCard(
                          width: 180.w,
                          height: double.infinity.h,
                          border: _currentIndex == index
                              ? Border.all(color: orangeClr, width: 1.w)
                              : null,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 40.h,
                                width: 40.w,
                                child: CircleAvatar(
                                  backgroundImage: CachedNetworkImageProvider(
                                      '${Urls.imgUrl}${brand.image!.path}'),
                                ),
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
                  itemCount: widget.brandList.length,
                )),
            Gap(16.h),
            GetBuilder<BrandWisedProductListController>(builder: (controller) {
              return Expanded(
                child: MasonryGridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 26.h,
                  crossAxisSpacing: 30.w,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return CustomProductCard(
                      product: controller.productList[index],
                    );
                  },
                  itemCount: controller.productList.length,
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
