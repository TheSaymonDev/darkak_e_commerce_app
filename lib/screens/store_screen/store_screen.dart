import 'package:darkak_e_commerce_app/utils/app_colors.dart';
import 'package:darkak_e_commerce_app/models/demo_product_list.dart';
import 'package:darkak_e_commerce_app/models/product_query_model.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_appbar/appbar_searchview_with_back.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_card.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_filtering_and_sorting.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_product_item_gridview.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_query_tab.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {

  bool _isFollowing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteClr,
      appBar: AppbarSearchviewWithBack(onPressedBack: (){Get.back();}, onChanged: (value){}),
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Gap(16.h),
              CustomCard(
                  height: 100.h,
                  width: double.infinity.w,
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 68.h,
                        width: 68.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            image: const DecorationImage(
                                image: AssetImage('assets/images/shop.png'),
                                fit: BoxFit.cover)),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Legacy Fashion',
                            style: myStyle(
                                15.sp, FontWeight.normal, blackClr),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.follow_the_signs,
                                color: orangeClr,
                                size: 15.sp,
                              ),
                              Gap(4.w),
                              Text(
                                '2.9k',
                                style: myStyle(
                                    15.sp, FontWeight.normal, blackClr),
                              ),
                            ],
                          ),
                          Text(
                            '85% positive seller ratings',
                            style: myStyle(
                                15.sp, FontWeight.normal, blackClr),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isFollowing = !_isFollowing;
                          });
                        },
                        child: _isFollowing == true
                            ? Container(
                                height: 34.h,
                                width: 100.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: orangeClr.withOpacity(0.5),
                                ),
                                child: Text(
                                  'Following',
                                  style: myStyle(
                                      20.sp, FontWeight.bold, whiteClr),
                                ),
                              )
                            : Container(
                                height: 34.h,
                                width: 100.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    color: orangeClr),
                                child: Text(
                                  'Follow',
                                  style: myStyle(
                                      20.sp, FontWeight.bold, whiteClr),
                                ),
                              ),
                      ),
                    ],
                  )),
              Gap(16.h),
              CustomQueryTab(productQueryList: ProductQuery.productQueryList),
              Gap(16.h),
              const CustomFilteringAndSorting(),
              Gap(20.h),
              CustomProductItemGridView(
                  productList: demoProductList,
                  physics: const NeverScrollableScrollPhysics()),
            ],
          ),
        ),
      ),
    );
  }
}
