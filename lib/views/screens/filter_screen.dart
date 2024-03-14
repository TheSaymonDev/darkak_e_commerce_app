
import 'package:darkak_e_commerce_app/core/utils/colors.dart';
import 'package:darkak_e_commerce_app/core/utils/urls.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_two_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final List<String> brands = [
    'Apple',
    'Samsung',
    'Google',
    'Microsoft',
    'Sony'
  ];
  final List<String> _selectedBrands = [];

  RangeValues _priceRange = const RangeValues(200, 400); // Initial range

  final Map<String, Color> colors = {
    'Red': Colors.red,
    'Blue': Colors.blue,
    'Green': Colors.green,
    'Yellow': Colors.yellow,
  };
  final List<String> _selectedColors = [];
  void _toggleColorSelection(String colorName) {
    setState(() {
      if (_selectedColors.contains(colorName)) {
        _selectedColors.remove(colorName);
      } else {
        _selectedColors.add(colorName);
      }
    });
  }

  final List<String> sizes = ['S', 'M', 'L', 'XL', 'XXL'];
  final List<String> _selectedSize = [];
  void _toggleSizeSelection(String sizeName) {
    setState(() {
      if (_selectedSize.contains(sizeName)) {
        _selectedSize.remove(sizeName);
      } else {
        _selectedSize.add(sizeName);
      }
    });
  }

  final List<String> _shippingOptions = ['Bangladesh', 'Worldwide'];
  late String _selectedShippingOption;

  final List<String> _categories = [
    'Men',
    'Women',
    'Kids',
    'Gadgets',
    'Devices',
  ];
  final List<String> _selectedCategories = [];

  void _toggleCategorySelection(String categoryName) {
    setState(() {
      if (_selectedCategories.contains(categoryName)) {
        _selectedCategories.remove(categoryName);
      } else {
        _selectedCategories.add(categoryName);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedShippingOption = _shippingOptions[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteClr,
      appBar: AppbarTextviewWithBack(
        onPressedBack: () {
          Get.back();
        },
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
                      subTitle: _selectedBrands.isEmpty
                          ? 'Select Brand'
                          : _selectedBrands.join(', '),
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: brands.length,
                          itemBuilder: (context, index) {
                            final brand = brands[index];
                            return CheckboxListTile(
                              title: Text(
                                brand,
                                style: myStyle(
                                    20.sp, FontWeight.bold, blackClr),
                              ),
                              value: _selectedBrands.contains(brand),
                              activeColor: orangeClr,
                              tileColor: orangeClr.withOpacity(0.1),
                              onChanged: (value) {
                                setState(() {
                                  if (value!) {
                                    _selectedBrands.add(brand);
                                  } else {
                                    _selectedBrands.remove(brand);
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
                            '${Urls.takaSign}${_priceRange.start.toStringAsFixed(0)}-${Urls.takaSign}${_priceRange.end.toStringAsFixed(0)}',
                        children: [
                          SliderTheme(
                            data: SliderThemeData(
                                trackHeight: 2.h,
                                valueIndicatorColor: orangeClr,
                                valueIndicatorTextStyle: myStyle(
                                    15.sp, FontWeight.bold, whiteClr)),
                            child: RangeSlider(
                              values: _priceRange,
                              min: 0,
                              max: 1000, // Adjust based on your price range
                              divisions: 10,
                              activeColor: orangeClr,
                              inactiveColor: orangeClr.withOpacity(0.3),
                              labels: RangeLabels(
                                _priceRange.start.toStringAsFixed(0),
                                _priceRange.end.toStringAsFixed(0),
                              ),
                              onChanged: (newRange) {
                                setState(() {
                                  _priceRange = newRange;
                                });
                              },
                            ),
                          )
                        ]),
                    _buildExpansionTile(
                        title: 'Color',
                        subTitle: _selectedColors.isEmpty
                            ? 'Select Color'
                            : _selectedColors.join(', '),
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              for (String colorName in colors.keys)
                                GestureDetector(
                                  onTap: () => _toggleColorSelection(colorName),
                                  child: Container(
                                    width: 35.w,
                                    height: 35.h,
                                    decoration: BoxDecoration(
                                      color: colors[colorName],
                                      borderRadius: BorderRadius.circular(4.r),
                                      border: Border.all(
                                        color:
                                            _selectedColors.contains(colorName)
                                                ? blackClr
                                                : Colors.transparent,
                                        width: 2.w,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ]),
                    _buildExpansionTile(
                        title: 'Size',
                        subTitle: _selectedSize.isEmpty
                            ? 'Select Size'
                            : _selectedSize.join(', '),
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              for (String sizeName in sizes)
                                GestureDetector(
                                  onTap: () => _toggleSizeSelection(sizeName),
                                  child: Container(
                                    height: 35.h,
                                    width: 35.w,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.r),
                                      color: _selectedSize.contains(sizeName)
                                          ? orangeClr
                                          : whiteClr,
                                      border: Border.all(
                                          color: orangeClr, width: 1.w),
                                    ),
                                    child: Text(
                                      sizeName,
                                      style: myStyle(
                                          15.sp,
                                          FontWeight.normal,
                                          _selectedSize.contains(sizeName)
                                              ? whiteClr
                                              : blackClr),
                                    ),
                                  ),
                                ),
                            ],
                          )
                        ]),
                    _buildExpansionTile(
                      title: 'Shipped From',
                      subTitle: _selectedShippingOption,
                      children: [
                        Row(
                          children: [
                            for (var option in _shippingOptions)
                              (option) {
                                // Create a closure
                                return Row(
                                  // Enclose Radio and Text within a Row
                                  children: [
                                    Radio<String>(
                                      activeColor: orangeClr,
                                      value: option,
                                      groupValue: _selectedShippingOption,
                                      onChanged: (value) => setState(() =>
                                          _selectedShippingOption = value!),
                                    ),
                                    Text(
                                      option,
                                      style: myStyle(
                                          20.sp, FontWeight.bold, blackClr),
                                    ), // Access option within the closure
                                  ],
                                );
                              }(option), // Pass option to the closure
                          ],
                        )
                      ],
                    ),
                    _buildExpansionTile(
                      title: 'Category',
                      subTitle: _selectedCategories.isEmpty
                          ? 'All'
                          : _selectedCategories.join(', '),
                      children: [
                        Wrap(
                          children: [
                            for (String categoryName in _categories)
                              GestureDetector(
                                onTap: () =>
                                    _toggleCategorySelection(categoryName),
                                child: Container(
                                  height: 40.h,
                                  width: 100.w,
                                  alignment: Alignment.center,
                                  margin:
                                      EdgeInsets.only(right: 8.w, bottom: 8.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.r),
                                    border: Border.all(color: orangeClr),
                                    color: _selectedCategories
                                            .contains(categoryName)
                                        ? orangeClr
                                        : whiteClr,
                                  ),
                                  child: Text(
                                    categoryName,
                                    style: myStyle(
                                        15.sp,
                                        FontWeight.normal,
                                        _selectedCategories
                                                .contains(categoryName)
                                            ? whiteClr
                                            : blackClr),
                                  ),
                                ),
                              )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Gap(32.h),
            CustomTwoButtons(
                leftButtonName: 'Clear',
                onLeftButtonPressed: () {
                  setState(() {
                    _selectedBrands.clear();
                    _selectedColors.clear();
                    _selectedSize.clear();
                    _selectedCategories.clear();
                  });
                },
                rightButtonName: 'Apply',
                onRightButtonPressed: () {
                  Get.back();
                }),
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
      collapsedIconColor: orangeClr,
      iconColor: orangeClr,
      shape: const RoundedRectangleBorder(
        side: BorderSide.none,
      ),
      title: Text(
        title,
        style: myStyle(25.sp, FontWeight.normal, blackClr),
      ),
      subtitle: Text(
        subTitle,
        style: myStyle(20.sp, FontWeight.normal, blackClr),
      ),
      children: children,
    );
  }
}
