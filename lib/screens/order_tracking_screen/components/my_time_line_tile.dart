import 'package:darkak_e_commerce_app/reusable/colors.dart';
import 'package:darkak_e_commerce_app/reusable/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MyTimeLineTile extends StatelessWidget {
  const MyTimeLineTile({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    required this.title,
    required this.address,
    required this.year,
    required this.time
  });

  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final String title;
  final String address;
  final String year;
  final String time;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: LineStyle(
            color: isPast ? orangeColor : orangeColor.withOpacity(0.3)),
        indicatorStyle: IndicatorStyle(
          color: isPast ? orangeColor : orangeColor.withOpacity(0.3),
          iconStyle: IconStyle(
              iconData: isPast ? Icons.done : Icons.circle,
              color: backgroundColor),
        ),
        endChild: Padding(
          padding: EdgeInsets.only(left: 40.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: myTextStyle(25.sp, FontWeight.normal, textColor),
              ),
              Text(
                address,
                style: myTextStyle(20.sp, FontWeight.normal, textColor),
              )
            ],
          ),
        ),
        startChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              year,
              style: myTextStyle(20.sp, FontWeight.normal, textColor.withOpacity(0.5)),
            ),
            Text(
              time,
              style: myTextStyle(15.sp, FontWeight.normal, textColor.withOpacity(0.5)),
            )
          ],
        ),
        alignment: TimelineAlign.manual,
        lineXY: 0.25,
      ),
    );
  }
}
