import 'package:flutter/material.dart';

import '/utils/constants.dart';

class PriceDetailsWidget extends StatelessWidget {
  const PriceDetailsWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Price Details:',
            style: kSubTitle2Style,
          ),
          const SizedBox(height: 10),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Rental Fee',
              ),
              Text(
                '\$ 205',
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Security Deposit',
              ),
              Text(
                '\$ 100',
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Service Charge',
              ),
              Text(
                '\$ 99',
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(
            height: 1,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Amount',
                style: kSubTitle2Style.copyWith(fontSize: 19),
              ),
              Text(
                '\$ 755',
                style: kSubTitle2Style.copyWith(fontSize: 19),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
