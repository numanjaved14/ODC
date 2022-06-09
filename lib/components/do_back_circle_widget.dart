import 'package:flutter/material.dart';

class GoBackForwardCircleWidget extends StatelessWidget {
  //used in CustomCalendarView circle to go back an forwar in months
  final VoidCallback? onTap;
  final IconData icon;
  const GoBackForwardCircleWidget({
    Key? key,
    this.onTap,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: onTap,
        child: Material(
          color: Colors.transparent,
          shape: const CircleBorder(
            side: BorderSide(
              color: Colors.grey,
            ),
          ),
          child: Icon(
            icon,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
