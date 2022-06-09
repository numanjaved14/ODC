import 'package:flutter/material.dart';

import '/components/rounded_button.dart';
import '/models/estate_list_data.dart';
import '/utils/constants.dart';
import '/pages/payment/check_out_page.dart';

class EstateDetailsFooter extends StatelessWidget {
  final EstateListData estateData;
  final double opacity3;
  const EstateDetailsFooter({
    Key? key,
    required this.opacity3,
    required this.estateData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: opacity3,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 48,
              height: 48,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16),
                  ),
                  border: Border.all(color: Colors.grey.withOpacity(0.2)),
                ),
                child: const Icon(
                  Icons.add,
                  color: kSecondaryColor,
                  size: 28,
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: RoundedButton(
                text: 'Confirm',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => CeckOutPage(
                        estateData: estateData,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
