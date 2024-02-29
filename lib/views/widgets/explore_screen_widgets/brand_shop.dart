import 'package:darkak_e_commerce_app/core/app_data.dart';
import 'package:darkak_e_commerce_app/models/brand_model.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:darkak_e_commerce_app/views/screens/store_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class BrandShop extends StatelessWidget {
  const BrandShop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      width: double.infinity.w,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final brand = BrandModel.brandList[index];
            return GestureDetector(
              onTap: (){
                Get.to(()=>const StorePage());
              },
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.r)),
                child: Container(
                  height: double.infinity.h,
                  width: 180.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: whiteClr),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40.h,
                        width: 40.w,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                            brand.imgUrl,
                          ),
                        ),
                      ),
                      Gap(26.w),
                      Column(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            brand.name,
                            style: myStyle(25.sp,
                                FontWeight.bold, blackClr),
                          ),
                          Text(
                            '${brand.totalProducts} Products',
                            style: myStyle(15.sp,
                                FontWeight.normal, greyClr),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => Gap(30.w),
          itemCount: BrandModel.brandList.length),
    );
  }
}
