import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> items;
  final int initialSelectionIndex;
  final void Function(String?) onChanged;

  const CustomDropdown({
    super.key,
    required this.items,
    this.initialSelectionIndex = 0,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    String selectedItem = items.isNotEmpty ? items[initialSelectionIndex] : '';
    return DropdownButton<String>(
      underline: const SizedBox(
        height: 0,
      ),
      style: Get.textTheme.titleSmall,
      items: items.map((String item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: onChanged,
      value: selectedItem.isEmpty && items.isNotEmpty ? items[0] : selectedItem,
    );
  }
}
