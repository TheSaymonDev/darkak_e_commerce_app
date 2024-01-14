import 'package:darkak_e_commerce_app/reusable/colors.dart';
import 'package:darkak_e_commerce_app/reusable/styles.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_bottom_sheet.dart';
import 'package:darkak_e_commerce_app/screens/filter_and_sort_screens/filter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CustomFilteringAndSorting extends StatefulWidget {
  const CustomFilteringAndSorting({super.key});

  @override
  State<CustomFilteringAndSorting> createState() =>
      _CustomFilteringAndSortingState();
}

class _CustomFilteringAndSortingState extends State<CustomFilteringAndSorting> {
  final List<String> _sortingOptions = [
    'Popular',
    'Newest',
    'Price: Lowest to High',
    'Price: Highest to Low',
  ];
  String _sortText = 'Sort by';
  int _selectedSort = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Get.to(()=>FilterPage());
          },
          child: Row(
            children: [
              Icon(
                Icons.filter_list_outlined,
                size: 25.sp,
                color: orangeColor,
              ),
              Gap(4.w),
              Text(
                'Filters',
                style: myTextStyle(15.sp, FontWeight.normal, textColor),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            _showSortingBottomSheet();
          },
          child: Row(
            children: [
              Icon(
                Icons.sort,
                size: 25.sp,
                color: orangeColor,
              ),
              Gap(4.w),
              Text(
                _sortText,
                style: myTextStyle(15.sp, FontWeight.normal, textColor),
              ),
            ],
          ),
        )
      ],
    );
  }

  void _showSortingBottomSheet() {
    Get.bottomSheet(
      CustomBottomSheet(
        children: [
          Center(
            child: Text(
              'Sort By',
              style: myTextStyle(25.sp, FontWeight.bold, textColor),
            ),
          ),
          Gap(32.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              _sortingOptions.length,
              (index) => ListTile(
                title: Text(
                  _sortingOptions[index],
                  style: myTextStyle(20.sp, FontWeight.normal, textColor),
                ),
                onTap: () => _handleSortingOptionTap(index),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleSortingOptionTap(int index) {
    setState(() {
      _selectedSort = index;
      _sortText = _sortingOptions[_selectedSort];
    });
    Get.back();
  }
}
