import 'package:flutter/material.dart';

import '/utils/constants.dart';

class CheckInTimeWidget extends StatelessWidget {
  const CheckInTimeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Check-in Time',
            style: kSubTitle2Style,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Check-in Date'),
              Text('19/02/2021'),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Check-out Date'),
              Text('11/12/2021'),
            ],
          ),
        ],
      ),
    );
  }
}
