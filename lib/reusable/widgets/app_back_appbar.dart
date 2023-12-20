import 'package:e_commerce_app/reusable/colors.dart';
import 'package:flutter/material.dart';

class AppBackAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppBackAppBar({super.key, required this.onPressed, this.title});

  final String? title;
  final void Function()? onPressed;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      leading: IconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.keyboard_arrow_left),
      ),
      title: title != null ? Text(title!) : null,
    );
  }
}
