import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '/utils/constants.dart';

class DistanceView extends StatefulWidget {
  const DistanceView({Key? key}) : super(key: key);

  @override
  State<DistanceView> createState() => _DistanceViewState();
}

class _DistanceViewState extends State<DistanceView> {
  double distValue = 50;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Distance from city center',
            textAlign: TextAlign.left,
            style: kSubTitle2Style,
          ),
        ),
        SfSlider(
          min: 0,
          max: 100,
          activeColor: kSecondaryColor,
          inactiveColor: Colors.grey.withOpacity(0.3),
          value: distValue,
          showTicks: true,
          showLabels: true,
          enableTooltip: true,
          minorTicksPerInterval: 1,
          onChanged: (value) {
            setState(() {
              distValue = value;
            });
          },
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
