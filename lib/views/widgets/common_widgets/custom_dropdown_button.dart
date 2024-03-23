import 'package:darkak_e_commerce_app/core/utils/colors.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomDropdownButton<T> extends StatelessWidget {
  const CustomDropdownButton({
    super.key,
    required this.items,
    required this.onChanged,
    required this.labelText,
    this.validator
  });

  final List<T> items;
  final ValueChanged<T?> onChanged;
  final String labelText;
  final String? Function(T?)? validator;

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
            style: Get.textTheme.bodyMedium!.copyWith(color: blackClr.withOpacity(0.5))
          ),
          Expanded(
            child: DropdownButtonFormField2(
              hint: Text(
                'Select',
                style: Get.textTheme.bodyMedium!.copyWith(color: greyClr)
              ),
              iconStyleData: IconStyleData(
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: orangeClr,
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
                fillColor: whiteClr,
                filled: true,
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(width: 2, color: orangeClr),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(width: 2, color: orangeClr),
                ),
              ),
              validator: validator,
              items: items.map((item) {
                return DropdownMenuItem<T>(
                  value: item,
                  child: Text(item.toString(),
                      style: myStyle(20.sp, FontWeight.normal, blackClr)),
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
