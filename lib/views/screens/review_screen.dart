import 'dart:io';
import 'package:darkak_e_commerce_app/core/utils/colors.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:darkak_e_commerce_app/views/screens/home_screen.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  final _reviewController = TextEditingController();
  List<File> _selectedImages = [];

  Future<void> _pickImagesFromGallery() async {
    final List<XFile>? images = await ImagePicker().pickMultiImage();
    if (images != null) {
      setState(() {
        _selectedImages = images.map((e) => File(e.path)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteClr,
      appBar: AppbarTextviewWithBack(
        onPressedBack: () {},
        title: 'Review & Rating',
      ),
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Gap(40.h),
              Text(
                'What is your rate?',
                style: myStyle(25.sp, FontWeight.normal, blackClr),
              ),
              Gap(8.h),
              RatingBar.builder(
                initialRating: 0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: yellowClr,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              Gap(40.h),
              Text(
                'Please share your opinion\nabout the product',
                style: myStyle(20.sp, FontWeight.normal, blackClr),
                textAlign: TextAlign.center,
              ),
              Gap(8.h),
              SizedBox(
                height: 200.h,
                child: TextFormField(
                  maxLines: 5,
                  cursorColor: blackClr,
                  controller: _reviewController,
                  decoration: InputDecoration(
                    hintText: 'Write your review',
                    fillColor: whiteClr,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.r),
                        borderSide: BorderSide(color: orangeClr, width: 1.w)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.r),
                        borderSide: BorderSide(color: orangeClr, width: 1.w)),
                  ),
                ),
              ),
              Gap(16.h),
              SizedBox(
                height: 100.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: _selectedImages.isEmpty
                          ? const SizedBox()
                          : ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: _selectedImages.length,
                              separatorBuilder: (context, index) => Gap(4.w),
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  height: 100.h,
                                  width: 104.w,
                                  child: Image.file(_selectedImages[index],
                                      fit: BoxFit.cover),
                                );
                              },
                            ),
                    ),
                    GestureDetector(
                      onTap: _pickImagesFromGallery,
                      child: SizedBox(
                        height: 100.h,
                        width: 104.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 60.h,
                              width: 60.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: orangeClr,
                              ),
                              child: Icon(Icons.camera_alt_outlined,
                                  size: 20.sp, color: whiteClr),
                            ),
                            Gap(4.h),
                            Text('Add photos',
                                style:
                                    myStyle(15.sp, FontWeight.bold, blackClr)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(200.h),
              CustomElevatedButton(
                  onPressed: () {
                    customSnackMessage(title: 'Review Send Successful');
                    Get.to(()=> HomeScreen());
                  },
                  buttonName: 'Send Review',
                  width: double.infinity.w),
            ],
          ),
        ),
      ),
    );
  }

  // Future _pickImageFromGallery() async {
  //   final returnedImage =
  //   await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (returnedImage == null) return;
  //   setState(() {
  //     _selectedImage = File(returnedImage.path);
  //   });
  // }
}
