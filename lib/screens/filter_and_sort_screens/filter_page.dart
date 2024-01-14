import 'package:darkak_e_commerce_app/reusable/colors.dart';
import 'package:darkak_e_commerce_app/reusable/styles.dart';
import 'package:darkak_e_commerce_app/reusable/utility.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_two_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final List<String> brands = [
    'Apple',
    'Samsung',
    'Google',
    'Microsoft',
    'Sony'
  ];
  final List<String> selectedBrands = [];

  RangeValues _priceRange = const RangeValues(200, 400); // Initial range

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppbarTextviewWithBack(
        onPressedBack: () {},
        title: 'Filter',
      ),
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildExpansionTile(
                      title: 'Brands',
                      subTitle: selectedBrands.isEmpty
                          ? 'Selected Brand'
                          : selectedBrands.join(', '),
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: brands.length,
                          itemBuilder: (context, index) {
                            final brand = brands[index];
                            return CheckboxListTile(
                              title: Text(brand),
                              value: selectedBrands.contains(brand),
                              onChanged: (value) {
                                setState(() {
                                  if (value!) {
                                    selectedBrands.add(brand);
                                  } else {
                                    selectedBrands.remove(brand);
                                  }
                                });
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    _buildExpansionTile(
                        title: 'Price',
                        subTitle:
                            '${_priceRange.start.toStringAsFixed(0)}-${_priceRange.end.toStringAsFixed(0)}',
                        children: [
                          RangeSlider(
                            values: _priceRange,
                            min: 0,
                            max: 1000, // Adjust based on your price range
                            divisions: 10,
                            activeColor: orangeColor,
                            inactiveColor: orangeColor.withOpacity(0.3),
                            labels: RangeLabels(
                              _priceRange.start.toStringAsFixed(2),
                              _priceRange.end.toStringAsFixed(2),
                            ),
                            onChanged: (newRange) {
                              setState(() {
                                _priceRange = newRange;
                              });
                            },
                          ),
                        ]),
                    _buildExpansionTile(
                        title: 'Color',
                        subTitle: 'Red',
                        children: [
                          const SizedBox(),
                        ]),
                    _buildExpansionTile(
                        title: 'Size',
                        subTitle: 'M',
                        children: [
                          const SizedBox(),
                        ]),
                  ],
                ),
              ),
            ),
            CustomTwoButtons(
                leftButtonName: 'Clear',
                onLeftButtonPressed: () {},
                rightButtonName: 'Apply',
                onRightButtonPressed: () {}),
            Gap(32.h),
          ],
        ),
      ),
    );
  }

  ExpansionTile _buildExpansionTile({
    required String title,
    required String subTitle,
    required List<Widget> children,
  }) {
    return ExpansionTile(
      collapsedIconColor: orangeColor,
      iconColor: orangeColor,
      shape: const RoundedRectangleBorder(
        side: BorderSide.none,
      ),
      title: Text(
        title,
        style: myTextStyle(25.sp, FontWeight.normal, textColor),
      ),
      subtitle: Text(
        subTitle,
        style: myTextStyle(20.sp, FontWeight.normal, textColor),
      ),
      children: children,
    );
  }
}
