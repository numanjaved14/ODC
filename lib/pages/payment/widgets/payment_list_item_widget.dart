import 'package:flutter/material.dart';

import '/utils/constants.dart';

class PaymentListItemWidget extends StatelessWidget {
  final String imgUrl;
  final String text;
  final bool isSelected;
  final bool showArrow;
  final VoidCallback? onTap;

  const PaymentListItemWidget({
    Key? key,
    required this.imgUrl,
    required this.text,
    this.showArrow = true,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 63,
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isSelected ? kSecondaryColor : Colors.grey[300]!,
          width: 1,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage('assets/images/$imgUrl'),
              ),
              const SizedBox(width: 20),
              Text(
                text,
                style: kSubTextStyle,
              ),
              const Spacer(),
              if (showArrow)
                const Icon(
                  Icons.arrow_forward_ios,
                  color: kSecondaryColor,
                  size: 20,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
