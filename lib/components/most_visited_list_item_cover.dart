import 'package:flutter/material.dart';

import '/utils/constants.dart';

class MostVisitedListItemCover extends StatelessWidget {
  final String title;
  final String? subTitle;
  final String imagePath;
  final String heroTag;

  const MostVisitedListItemCover({
    Key? key,
    required this.title,
    this.subTitle,
    required this.imagePath,
    required this.heroTag,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: kBoxShadow,
      ),
      child: Stack(
        children: <Widget>[
          Hero(
            tag: heroTag,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                imagePath,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                ),
                Text(
                  subTitle ?? '',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
