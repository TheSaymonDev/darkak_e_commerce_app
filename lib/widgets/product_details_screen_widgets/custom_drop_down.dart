import 'package:darkak_e_commerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropdown<T> extends StatelessWidget {
  final List<T> items;
  final ValueChanged<T?> onChanged;

  const CustomDropdown({
    super.key,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      underline: const SizedBox(
        height: 0,
      ),
      style: Get.textTheme.titleSmall,
      icon: const Icon(Icons.arrow_drop_down_circle_outlined, color: blackClr),
      items: items.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item.toString(),
              style: Get.textTheme.bodyMedium),
        );
      }).toList(),
      padding: EdgeInsets.zero,
      onChanged: onChanged,
    );
  }
}
