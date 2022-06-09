import 'package:flutter/material.dart';

import '/utils/constants.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final BorderRadius? borderRadius;
  const CustomTextFormField({
    Key? key,
    required this.hintText,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: borderRadius ??
                const BorderRadius.all(
                  Radius.circular(38),
                ),
            boxShadow: kBoxShadow),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, top: 6, bottom: 6),
          child: TextField(
            onChanged: (String text) {},
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[400],
            ),
            cursorColor: kPrimaryColor,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
            ),
          ),
        ),
      ),
    );
  }
}
