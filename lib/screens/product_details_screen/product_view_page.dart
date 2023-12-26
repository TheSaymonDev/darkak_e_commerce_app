import 'package:flutter/material.dart';

class ProductViewPage extends StatelessWidget {
  ProductViewPage({super.key, required this.imgUrl});

  String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(child: Image.asset(imgUrl),)),
    );
  }
}
