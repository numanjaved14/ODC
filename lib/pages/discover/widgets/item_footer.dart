import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '/models/estate_list_data.dart';
import '/utils/constants.dart';

class ItemFooter extends StatelessWidget {
  final EstateListData? estateData;
  const ItemFooter({
    Key? key,
    required this.estateData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    estateData!.titleTxt,
                    textAlign: TextAlign.left,
                    style: kSubTitle2Style,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        estateData!.subTxt,
                        style: kSubTextStyle,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const Icon(
                        FontAwesomeIcons.mapMarkerAlt,
                        size: 12,
                        color: kPrimaryColor,
                      ),
                      Expanded(
                        child: Text(
                          '${estateData!.distance.toStringAsFixed(1)} km to city',
                          overflow: TextOverflow.ellipsis,
                          style: kSubTextStyle,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Row(
                      children: <Widget>[
                        RatingBar(
                          initialRating: estateData!.rating,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 24,
                          ratingWidget: RatingWidget(
                            full: const Icon(
                              Icons.star_rate_rounded,
                              color: kSecondaryColor,
                            ),
                            half: const Icon(
                              Icons.star_half_rounded,
                              color: kSecondaryColor,
                            ),
                            empty: const Icon(
                              Icons.star_border_rounded,
                              color: kSecondaryColor,
                            ),
                          ),
                          itemPadding: EdgeInsets.zero,
                          onRatingUpdate: (rating) {
                            // print(rating);
                          },
                        ),
                        Text(
                          ' ${estateData!.reviews} Reviews',
                          style: kSubTextStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16, top: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  '\$${estateData!.perMonth}',
                  textAlign: TextAlign.left,
                  style: kSubTitle2Style,
                ),
                const Text('/per month', style: kSubTextStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
