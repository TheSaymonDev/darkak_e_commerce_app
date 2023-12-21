import 'package:e_commerce_app/reusable/colors.dart';
import 'package:e_commerce_app/reusable/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class AppCountdownTimer extends StatelessWidget {
  final Duration duration;

  const AppCountdownTimer({super.key, required this.duration});

  @override
  Widget build(BuildContext context) {

    final formatter = DateFormat('HH:mm:ss');
    final formattedDuration = formatter.format(DateTime(0, 1, 1,
        duration.inHours, duration.inMinutes % 60, duration.inSeconds % 60));

    final List<String> timeParts = formattedDuration.split(':');
    final String hour = timeParts[0];
    final String minute = timeParts[1];
    final String second = timeParts[2];

    return Row(
      children: [
        Text(
          'Flash Sell',
          style: myTextStyle(25.sp, FontWeight.bold, textColor),
        ),
        const Spacer(),
        Text(
          'Closing in ',
          style: myTextStyle(20.sp, FontWeight.normal, orangeColor),
        ),
        _timerStyle(hour),
        Text(
          ':',
          style: myTextStyle(20.sp, FontWeight.normal, orangeColor),
        ),
        _timerStyle(minute),
        Text(
          ':',
          style: myTextStyle(20.sp, FontWeight.normal, orangeColor),
        ),
        _timerStyle(second),
      ],
    );
  }

  Container _timerStyle(String value) {
    return Container(
        height: 26.h,
        width: 28.w,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.r), color: orangeColor),
        child: Text(
          value,
          style: myTextStyle(20.sp, FontWeight.normal, backgroundColor),
        ));
  }
}
