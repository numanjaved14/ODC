import 'package:flutter/material.dart';

import '/utils/constants.dart';

class CalendarHeaderItem extends StatelessWidget {
  final String title;
  final Widget widget;
  const CalendarHeaderItem({
    Key? key,
    required this.widget,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: kSubTitleStyle,
          ),
          const SizedBox(
            height: 4,
          ),
          widget,
        ],
      ),
    );
  }
}
