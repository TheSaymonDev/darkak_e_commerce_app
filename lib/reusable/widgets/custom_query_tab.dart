import 'package:darkak_e_commerce_app/models/product_query_model.dart';
import 'package:darkak_e_commerce_app/reusable/colors.dart';
import 'package:darkak_e_commerce_app/reusable/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CustomQueryTab extends StatefulWidget {
  const CustomQueryTab({super.key, required this.productQueryList,});

  final List<ProductQuery> productQueryList;

  @override
  State<CustomQueryTab> createState() => _CustomQueryTabState();
}

class _CustomQueryTabState extends State<CustomQueryTab> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 40.h,
      width: double.infinity.w,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _currentIndex = index;
                setState(() {});
              },
              child: Container(
                height: double.infinity.h,
                width: 100.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  border: Border.all(color: orangeColor),
                  color: _currentIndex == index
                      ? orangeColor
                      : backgroundColor,
                ),
                child: Text(
                  widget.productQueryList[index]
                      .title,
                  style: myTextStyle(
                      15.sp,
                      FontWeight.normal,
                      _currentIndex == index
                          ? backgroundColor
                          : orangeColor),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => Gap(10.w),
          itemCount: widget.productQueryList.length),
    );
  }
}
