import 'package:darkak_e_commerce_app/reusable/colors.dart';
import 'package:darkak_e_commerce_app/reusable/styles.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdownButton<T> extends StatelessWidget {
  const CustomDropdownButton({
    super.key,
    required this.items,
    required this.onChanged,
    required this.labelText,
  });

  final List<T> items;
  final ValueChanged<T?> onChanged;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      width: double.infinity.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: myTextStyle(
                20.sp, FontWeight.normal, textColor.withOpacity(0.5)),
          ),
          Expanded(
            child: DropdownButtonFormField2(
              hint: Text(
                'Select',
                style: myTextStyle(20.sp, FontWeight.normal, greyColor),
              ),
              iconStyleData: IconStyleData(
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: orangeColor,
                ),
                iconSize: 25.sp,
              ),
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              menuItemStyleData: MenuItemStyleData(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 0.w),
                fillColor: backgroundColor,
                filled: true,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 2, color: orangeColor),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 2, color: orangeColor),
                ),
              ),
              items: items.map((item) {
                return DropdownMenuItem<T>(
                  value: item,
                  child: Text(item.toString(),
                      style: myTextStyle(20.sp, FontWeight.normal, textColor)),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
