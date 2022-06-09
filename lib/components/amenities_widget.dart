import 'package:flutter/material.dart';

import '/components/custom_box.dart';
import '/utils/constants.dart';

class AmenitiesWidget extends StatelessWidget {
  const AmenitiesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Amenities',
            style: kSubTitle2Style,
          ),
          Row(
            children: const <Widget>[
              CustomBox(
                icon: (Icons.home),
                activeIcon: true,
                text: '6 rooms',
              ),
              CustomBox(
                icon: (Icons.wifi),
                activeIcon: true,
                text: 'Wifi',
              ),
              CustomBox(
                icon: (Icons.house),
                text: '1 floor',
              ),
              CustomBox(
                icon: (Icons.pool),
                activeIcon: true,
                text: 'Pool',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
