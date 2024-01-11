import 'package:flutter/material.dart';

class OrderTrackingEvent {
  final String title;
  final DateTime date;
  final IconData iconData;

  OrderTrackingEvent({
    required this.title,
    required this.date,
    required this.iconData,
  });
}
