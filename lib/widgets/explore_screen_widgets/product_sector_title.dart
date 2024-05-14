import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductSectorTitle extends StatelessWidget {
  final void Function()? onTap;
  final String? title;
  const ProductSectorTitle(
      {super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        title!,
        style: Get.textTheme.titleLarge,
      ),
      GestureDetector(
          onTap: onTap,
          child: Text(
            'See all',
            style: Get.textTheme.bodyMedium,
          ))
    ]);
  }
}
