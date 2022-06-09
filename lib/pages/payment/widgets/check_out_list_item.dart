import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../home/estate_detail_page.dart';
import '/models/estate_list_data.dart';
import '/utils/constants.dart';

class CheckOutListItem extends StatelessWidget {
  final EstateListData estateData;

  const CheckOutListItem({
    Key? key,
    required this.estateData,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(40, 5, 10, 5),
          height: 170,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: kBoxShadow,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(100, 10, 20, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        estateData.titleTxt,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: kSubTitle2Style.copyWith(
                          fontSize: 19,
                        ),
                      ),
                    ),
                    Text(
                      '\$${estateData.perMonth}',
                      style: kSubTitle2Style,
                    ),
                  ],
                ),
                Text(
                  estateData.lordLandName,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Row(
                  children: <Widget>[
                    RatingBar(
                      initialRating: estateData.rating,
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
                      ' ${estateData.reviews} Reviews',
                      style: kSubTextStyle,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  child: Container(
                    width: 90,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: kPrimaryColor,
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Details',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => EstateDetailsPage(
                          estateData: estateData,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 10,
          top: 15,
          bottom: 17,
          child: GestureDetector(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                width: 110,
                image: AssetImage(
                  estateData.imageUrl,
                ),
                fit: BoxFit.cover,
              ),
            ),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
