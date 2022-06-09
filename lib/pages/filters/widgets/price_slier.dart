import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '/utils/constants.dart';

class PriceSlider extends StatefulWidget {
  const PriceSlider({Key? key}) : super(key: key);

  @override
  State<PriceSlider> createState() => _PriceSliderState();
}

class _PriceSliderState extends State<PriceSlider> {
  SfRangeValues _values = const SfRangeValues(100, 600);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Price (for 1 Month)',
            textAlign: TextAlign.left,
            style: kSubTitle2Style,
          ),
        ),
        SfRangeSlider(
          min: 10,
          max: 1000,
          activeColor: kSecondaryColor,
          inactiveColor: Colors.grey.withOpacity(0.3),
          values: _values,
          showTicks: true,
          showLabels: true,
          enableTooltip: true,
          minorTicksPerInterval: 1,
          onChanged: (SfRangeValues values) {
            setState(() {
              _values = values;
            });
          },
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
