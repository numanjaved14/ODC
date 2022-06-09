import 'package:flutter/material.dart';

import '/utils/constants.dart';

class SeeAllWidget extends StatelessWidget {
  final String title;
  final bool seeAll;
  final VoidCallback? onPressed;

  const SeeAllWidget({
    Key? key,
    required this.title,
    required this.seeAll,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.1,
            ),
          ),
          if (seeAll)
            TextButton(
              onPressed: onPressed,
              child: const Text(
                'See all',
                style: TextStyle(
                  color: kSecondaryColor,
                  fontSize: 14,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
