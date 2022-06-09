import 'package:flutter/material.dart';

class NearbyListItem extends StatelessWidget {
  final String imagePath;
  final String estateName;

  const NearbyListItem({
    Key? key,
    required this.imagePath,
    required this.estateName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(
                imagePath,
              ),
            ),
          ),
          SizedBox(
            width: 70,
            child: Text(
              estateName,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
