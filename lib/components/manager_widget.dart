import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import '/utils/constants.dart';

class ManagerWidget extends StatelessWidget {
  final String managerName;
  final String managerImage;
  const ManagerWidget({
    Key? key,
    required this.managerName,
    required this.managerImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(
            managerImage,
          ),
        ),
        title: Text(
          managerName,
          style: kSubTitleStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: const Text(
          'Manager',
          style: TextStyle(
            fontSize: 13,
            letterSpacing: 0.3,
            color: Colors.grey,
          ),
        ),
        trailing: const CircleAvatar(
          radius: 20,
          backgroundColor: kPrimaryColor,
          child: Icon(
            Icons.message,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
