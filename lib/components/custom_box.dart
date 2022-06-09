import 'package:flutter/material.dart';

import '/utils/constants.dart';

class CustomBox extends StatelessWidget {
  final IconData icon;
  final bool activeIcon;
  final String text;
  const CustomBox({
    Key? key,
    this.activeIcon = false,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                offset: const Offset(1.4, 1.4),
                blurRadius: 8),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: Column(
            children: <Widget>[
              Icon(
                icon,
                color: activeIcon ? kSecondaryColor : Colors.grey,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 14,
                  letterSpacing: 0.3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
