import 'package:darkak_e_commerce_app/screens/product_view_screen/controllers/product_view_controller.dart';
import 'package:darkak_e_commerce_app/utils/app_colors.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductViewScreen extends StatelessWidget {
  ProductViewScreen(
      {super.key});

 final _productViewController = Get.find<ProductViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteClr,
      appBar: AppbarTextviewWithBack(onPressedBack: () {
        Get.back();
      }),
      body: Center(
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _productViewController.imagesPath.length,
          itemBuilder: (context, index) => GestureDetector(
            onDoubleTapDown: (details){
              _productViewController.tapDownDetails = details;
            },
            onDoubleTap: (){
              final position = _productViewController.tapDownDetails!.localPosition;
              const double scale = 3;
              final x = -position.dx * (scale - 1);
              final y = -position.dx * (scale - 1);
              final zoomed = Matrix4.identity()..translate(x, y)..scale(scale);
              final value = _productViewController.controller.value.isIdentity()?zoomed:Matrix4.identity();
              _productViewController.controller.value = value;
            },
            child: InteractiveViewer(
              clipBehavior: Clip.none,
              scaleEnabled: true,
              panEnabled: true,
              transformationController: _productViewController.controller,
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network('${AppUrls.imgUrl}${_productViewController.imagesPath[index].path}'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
