import 'package:flutter/material.dart';

import '/models/estate_list_data.dart';

class DescriptionWidget extends StatelessWidget {
  final EstateListData? estateData;
  final double opacity2;
  const DescriptionWidget({
    Key? key,
    required this.opacity2,
    required this.estateData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: opacity2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          estateData!.description,
          textAlign: TextAlign.justify,
          style: const TextStyle(
            fontSize: 14,
            letterSpacing: 0.3,
            color: Colors.grey,
          ),
          maxLines: 15,
        ),
      ),
    );
  }
}
