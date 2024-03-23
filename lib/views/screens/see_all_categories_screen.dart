import 'package:darkak_e_commerce_app/core/utils/colors.dart';
import 'package:darkak_e_commerce_app/models/see_all_categories_model.dart';
import 'package:darkak_e_commerce_app/views/widgets/common_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:darkak_e_commerce_app/views/widgets/common_widgets/custom_card_style.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:darkak_e_commerce_app/views/screens/product_listing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SeeAllCategoriesScreen extends StatefulWidget {
  const SeeAllCategoriesScreen({super.key});

  @override
  State<SeeAllCategoriesScreen> createState() => _SeeAllCategoriesScreenState();
}

class _SeeAllCategoriesScreenState extends State<SeeAllCategoriesScreen> {
  String categoryName = 'Category';
  int _currentIndex = 0;
  List<CategoryChild> _selectedCategoryChildren = [];

  @override
  void initState() {
    super.initState();
    _selectedCategoryChildren = Category.categoryList[0].categoryChildList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteClr,
      appBar: AppbarTextviewWithBack(
          onPressedBack: () {
            Get.back();
          },
          title: 'Category'),
      body: SizedBox(
        height: double.infinity.h,
        width: double.infinity.w,
        child: Row(
          children: [
            SizedBox(
              height: double.infinity.h,
              width: 118.w,
              child: ListView.separated(
                  itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          setState(
                            () {
                              _currentIndex = index;
                              _selectedCategoryChildren = Category
                                  .categoryList[index].categoryChildList;
                            },
                          );
                        },
                        child: Container(
                          height: 95.h,
                          width: 118.w,
                          color: _currentIndex == index
                              ? whiteClr
                              : greyClr.withOpacity(0.2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomCardStyle(
                                isCircle: true,
                                height: 26.h,
                                width: 26.w,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4.w, vertical: 4.h),
                                child: SvgPicture.asset(
                                  Category
                                      .categoryList[index].categoriesImageUrl,
                                ),
                              ),
                              Gap(4.h),
                              Text(
                                Category.categoryList[index].categoriesName,
                                style: myStyle(
                                    15.sp, FontWeight.normal, greyClr),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                  separatorBuilder: (context, index) => Gap(0.h),
                  itemCount: Category.categoryList.length),
            ),
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 8.w, right: 16.w),
                    child: Card(
                      color: whiteClr,
                      child: ExpansionTile(
                        collapsedIconColor: orangeClr,
                        iconColor: orangeClr,
                        shape: const RoundedRectangleBorder(
                          side: BorderSide.none,
                        ),
                        title: Text(
                          _selectedCategoryChildren[index].categoryChildName,
                          style:
                              myStyle(20.sp, FontWeight.normal, blackClr),
                        ),
                        children: [
                          GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8.w,
                              mainAxisSpacing: 8.h,
                            ),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, subIndex) {
                              return InkWell(
                                onTap: () {
                                  Get.to(() => ProductListingScreen(
                                      productList:
                                          _selectedCategoryChildren[index]
                                              .subCategoryList[subIndex]
                                              .productList));
                                },
                                child: Card(
                                  color: whiteClr,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Container(
                                    height: 90.h,
                                    width: double.infinity.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                      color: whiteClr,
                                    ),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: double.infinity.w,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4.r),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                    _selectedCategoryChildren[
                                                            index]
                                                        .subCategoryList[
                                                            subIndex]
                                                        .subCategoryImageUrl,
                                                  ),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                        ),
                                        Gap(8.h),
                                        Text(
                                          _selectedCategoryChildren[index]
                                              .subCategoryList[subIndex]
                                              .subCategoryName,
                                          style: myStyle(
                                            15.sp,
                                            FontWeight.normal,
                                            blackClr,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Gap(8.h),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: _selectedCategoryChildren[index]
                                .subCategoryList
                                .length,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Gap(1.h),
                itemCount: _selectedCategoryChildren.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
