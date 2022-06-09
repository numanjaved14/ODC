import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'calendar_header_item.dart';

class CalendarHeader extends StatelessWidget {
  final DateTime? startDate;
  final DateTime? endDate;
  const CalendarHeader({
    Key? key,
    required this.startDate,
    required this.endDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CalendarHeaderItem(
          title: 'From',
          widget: Text(
            startDate != null
                ? DateFormat('EEE, dd MMM').format(startDate!)
                : '--/-- ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        Container(
          height: 74,
          width: 1,
          color: Colors.grey,
        ),
        CalendarHeaderItem(
          title: 'To',
          widget: Text(
            endDate != null
                ? DateFormat('EEE, dd MMM').format(endDate!)
                : '--/-- ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
