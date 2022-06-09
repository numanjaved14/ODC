import 'package:flutter/material.dart';

import '/components/most_visited_list_item_cover.dart';
import '/models/estate_list_data.dart';
import '/utils/constants.dart';

class MostVisitedListItem extends StatelessWidget {
  final EstateListData? estateData;
  final VoidCallback? onTap;
  final String heroTag;

  const MostVisitedListItem({
    Key? key,
    required this.estateData,
    required this.onTap,
    required this.heroTag,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10),
        width: 210,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Positioned(
              bottom: 15,
              child: Container(
                height: 120,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: kBoxShadow,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        estateData!.perMonth.toString() + '\$ Per Month',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        estateData!.reviews.toString() + ' reviews',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            MostVisitedListItemCover(
              title: estateData!.titleTxt,
              subTitle: estateData!.subTxt,
              imagePath: estateData!.imageUrl,
              heroTag: heroTag,
            ),
          ],
        ),
      ),
    );
  }
}
