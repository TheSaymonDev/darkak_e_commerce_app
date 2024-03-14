import 'package:darkak_e_commerce_app/core/utils/colors.dart';
import 'package:darkak_e_commerce_app/core/utils/urls.dart';
import 'package:darkak_e_commerce_app/models/final_product.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductViewPage extends StatefulWidget {
  const ProductViewPage(
      {super.key, required this.imagePath, required this.imagesPath});

  final String? imagePath;
  final List<Images>? imagesPath;

  @override
  State<ProductViewPage> createState() => _ProductViewPageState();
}

class _ProductViewPageState extends State<ProductViewPage> {
  late TransformationController controller;
  TapDownDetails? tapDownDetails;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TransformationController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

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
          itemCount: widget.imagesPath!.length,
          itemBuilder: (context, index) => GestureDetector(
            onDoubleTapDown: (details){
              tapDownDetails = details;
            },
            onDoubleTap: (){
              final position = tapDownDetails!.localPosition;
              const double scale = 3;
              final x = -position.dx * (scale - 1);
              final y = -position.dx * (scale - 1);
              final zoomed = Matrix4.identity()..translate(x, y)..scale(scale);
              final value = controller.value.isIdentity()?zoomed:Matrix4.identity();
              controller.value = value;
            },
            child: InteractiveViewer(
              clipBehavior: Clip.none,
              scaleEnabled: true,
              panEnabled: true,
              transformationController: controller,
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network('${Urls.imgUrl}${widget.imagesPath![index].path}'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
