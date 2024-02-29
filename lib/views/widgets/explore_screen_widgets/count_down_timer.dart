
import 'package:darkak_e_commerce_app/core/app_data.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CountDownTimer extends StatelessWidget {
  final Duration duration;

  const CountDownTimer({super.key, required this.duration});

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
          style: myStyle(25.sp, FontWeight.bold, blackClr),
        ),
        const Spacer(),
        Text(
          'Closing in ',
          style: myStyle(20.sp, FontWeight.normal, orangeClr),
        ),
        _timerStyle(hour),
        Text(
          ':',
          style: myStyle(20.sp, FontWeight.normal, orangeClr),
        ),
        _timerStyle(minute),
        Text(
          ':',
          style: myStyle(20.sp, FontWeight.normal, orangeClr),
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
            borderRadius: BorderRadius.circular(2.r), color: orangeClr),
        child: Text(
          value,
          style: myStyle(20.sp, FontWeight.normal, whiteClr),
        ));
  }
}
