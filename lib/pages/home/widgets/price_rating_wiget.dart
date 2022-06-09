import 'package:flutter/material.dart';

import '/models/estate_list_data.dart';
import '/utils/constants.dart';

class PriceRatingWidget extends StatelessWidget {
  final EstateListData? estateData;
  const PriceRatingWidget({
    Key? key,
    required this.estateData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            estateData!.perMonth.toString() + ' \$',
            textAlign: TextAlign.left,
            style: kSubTitle2Style.copyWith(
              fontWeight: FontWeight.w400,
              color: kPrimaryColor,
            ),
          ),
          Row(
            children: <Widget>[
              Text(
                estateData!.rating.toString() + ' ',
                textAlign: TextAlign.left,
                style: kSubTitle2Style.copyWith(
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                ),
              ),
              const Icon(
                Icons.star,
                color: kSecondaryColor,
                size: 24,
              ),
            ],
          )
        ],
      ),
    );
  }
}
