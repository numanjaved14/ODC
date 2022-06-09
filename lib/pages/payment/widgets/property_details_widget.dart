import 'package:flutter/material.dart';

import '/utils/constants.dart';

class PropertyDetails extends StatelessWidget {
  const PropertyDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Property Details',
            style: kSubTitle2Style,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(height: 20),
                  Text('Name'),
                  SizedBox(height: 8),
                  Text(
                    'DJ Simon',
                    style: kSubTextStyle,
                  ),
                  SizedBox(height: 20),
                  Text('Email'),
                  SizedBox(height: 8),
                  Text(
                    'DJ_Simon@Example.com',
                    style: kSubTextStyle,
                  ),
                  SizedBox(height: 20),
                  Text('Stay Informations'),
                  SizedBox(height: 8),
                  Text(
                    '19 Feb - 31 Aug',
                    style: kSubTextStyle,
                  ),
                  SizedBox(height: 20),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(height: 20),
                  Text('Phone'),
                  SizedBox(height: 8),
                  Text(
                    '+354 805 22 32',
                    style: kSubTextStyle,
                  ),
                  SizedBox(height: 20),
                  Text('Months'),
                  SizedBox(height: 8),
                  Text(
                    '5 Months ',
                    style: kSubTextStyle,
                  ),
                  SizedBox(height: 20),
                  Text('Rooms & Baths'),
                  SizedBox(height: 8),
                  Text(
                    '6 rooms, 4 baths',
                    style: kSubTextStyle,
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
