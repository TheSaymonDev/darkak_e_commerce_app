import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExploreScreenController extends GetxController{

  int currentPage = 0;
  final ScrollController scrollController = ScrollController();
  bool showSearchIcon = false;
  Duration duration = const Duration(hours: 12, minutes: 12, seconds: 12); // Initial duration
  late Timer timer;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    scrollController.addListener(_onScroll);
    _startTimer();
  }

  void _startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
          duration = duration - const Duration(seconds: 1);
          update();
          if (duration.isNegative) {
            timer.cancel();
            // Handle timer completion actions
          }
    });
  }

  @override
  void dispose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  void _onScroll() {
    showSearchIcon = scrollController.offset > 40; // Adjust threshold as needed
    update();
  }

  sliderChange(index){
    currentPage=index;
    update();
  }

}