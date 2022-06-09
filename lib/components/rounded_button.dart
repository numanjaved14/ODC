import 'package:flutter/material.dart';

import '/utils/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color color, textColor;
  final EdgeInsets? padding;
  const RoundedButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.color = kPrimaryColor,
    this.padding,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: newElevatedButton(),
      ),
    );
  }

  Widget newElevatedButton() {
    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: color,
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 35, vertical: 18),
        textStyle: TextStyle(
          color: textColor,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
