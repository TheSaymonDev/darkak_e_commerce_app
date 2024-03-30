import 'package:carousel_slider/carousel_slider.dart';
import 'package:darkak_e_commerce_app/controllers/onboarding_screen_controller.dart';
import 'package:darkak_e_commerce_app/core/services/shared_preferences_service.dart';
import 'package:darkak_e_commerce_app/core/utils/colors.dart';
import 'package:darkak_e_commerce_app/core/utils/urls.dart';
import 'package:darkak_e_commerce_app/views/screens/home_screen.dart';
import 'package:darkak_e_commerce_app/views/widgets/common_widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:geolocator/geolocator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool _locationPermissionGranted = false;

  String _currentLocation = '';

  Future<void> _checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    _locationPermissionGranted = permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
    setState(() {}); // Update UI based on permission status
  }

  Future<void> _getCurrentLocation() async {
    if (_locationPermissionGranted) {
      try {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low,
          timeLimit: const Duration(seconds: 5),
        );

        List<Placemark> placeMarks = await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        );

        Placemark placeMark =
            placeMarks[0]; // Assuming first result is accurate
        _currentLocation =
            '${placeMark.locality}, ${placeMark.country}'; // Format as desired
      } catch (error) {
        debugPrint('Error getting location: $error');
        _currentLocation = 'Unable to determine location.';
      }

      SharedPreferencesService().saveLocation(_currentLocation);
    }
  }

  Future<void> _navigateToHomeScreen() async {
    await _checkLocationPermission();
    if (_locationPermissionGranted) {
      await _getCurrentLocation();
    }
    Get.offAll(const HomeScreen(
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteClr,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GetBuilder<OnboardingController>(
              builder: (controller) {
                return CarouselSlider.builder(
                  itemCount: 3,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset(
                          Urls.appLogoSvg,
                          height: 208.h,
                          width: 264.w,
                          fit: BoxFit.cover,
                        ),
                        Gap(100.h),
                        Text(
                          'Start Your Journey',
                          style: Get.textTheme.titleLarge,
                        ),
                        Gap(18.h),
                        Text(
                          'Lorem ipsum simply dummy text of the printing and typesetting industry',
                          style: Get.textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  },
                  options: CarouselOptions(
                    onPageChanged: (index, reason) =>
                        controller.onPageChange(index),
                    initialPage: 0,
                    height: 569.h,
                    autoPlay: true,
                    viewportFraction: 1,
                  ),
                );
              },
            ),
            Gap(30.h),
            GetBuilder<OnboardingController>(
              builder: (controller) {
                return SmoothPageIndicator(
                  controller:
                      PageController(initialPage: controller.currentPage),
                  count: 3,
                  effect: ExpandingDotsEffect(
                    dotHeight: 5.0.h,
                    dotWidth: 10.0.w,
                    activeDotColor: orangeClr,
                    dotColor: Colors.grey,
                  ),
                  onDotClicked: (index) => controller.onDotClick(index),
                );
              },
            ),
            const Spacer(),
            CustomElevatedButton(
              onPressed: () {
                SharedPreferencesService().saveScreen(true);
                _navigateToHomeScreen();
              },
              buttonName: 'Get Start',
              width: 310.w,
            ),
            Gap(32.h),
          ],
        ),
      ),
    );
  }
}
