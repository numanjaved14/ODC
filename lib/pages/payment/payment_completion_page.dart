import 'package:flutter/material.dart';

import '/components/rounded_button.dart';
import '/utils/constants.dart';
import '/pages/drawer/home_navigation.dart';

class PaymentCompletionPage extends StatelessWidget {
  const PaymentCompletionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 200),
                child: Column(
                  children: [
                    Text(
                      'Thanks, Simon',
                      style: kSubTitle2Style.copyWith(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Your Rental is now completed!',
                      style: kSubTitle2Style.copyWith(
                        color: kPrimaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.check_circle_outlined,
                          color: kSecondaryColor,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Text(
                            'We sent your Confirm Email to \'DJ_Simon@Exemple.com\'.',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.check_circle_outlined,
                          color: kSecondaryColor,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Text(
                            'Your rental ID is : FE8964568.',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.check_circle_outlined,
                          color: kSecondaryColor,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Text(
                            'Please present this confirmation at check-in. ',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.check_circle_outlined,
                          color: kSecondaryColor,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Text(
                            'Prepayment is needed for this rental, All payments are handled by Lotus Estates. See your Payment Details for more info. ',
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                    const Expanded(
                      child: SizedBox(
                        height: 20,
                      ),
                    ),
                    RoundedButton(
                      text: 'Back to Home',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const NavigationHomePage(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
