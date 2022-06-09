import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '/components/rounded_button.dart';
import '/utils/constants.dart';
import '/components/custom_text_form_field.dart';
import 'payment_completion_page.dart';

class AddCardPage extends StatelessWidget {
  const AddCardPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Add Card',
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Icon(
              FontAwesomeIcons.ellipsisV,
              color: Colors.white,
              size: 17,
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: double.infinity,
                        height: 220,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: kBoxShadow,
                          image: const DecorationImage(
                            image: AssetImage(
                              'assets/images/bank.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Enter Your card Details',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const CustomTextFormField(
                        hintText: 'Holder First Name',
                      ),
                      const CustomTextFormField(
                        hintText: 'Holder Last Name',
                      ),
                      const CustomTextFormField(
                        hintText: 'Card Number',
                      ),
                      Row(
                        children: const [
                          Expanded(
                            child: CustomTextFormField(
                              hintText: 'Expiration Date',
                            ),
                          ),
                          Expanded(
                            child: CustomTextFormField(
                              hintText: 'Cvv',
                            ),
                          ),
                        ],
                      ),
                      const Expanded(
                        child: SizedBox(
                          height: 20,
                        ),
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.check_box,
                            color: kSecondaryColor,
                          ),
                          SizedBox(width: 4),
                          Text('Save this Card for future Payments?'),
                        ],
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: RoundedButton(
                          text: 'Add Card',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const PaymentCompletionPage(),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      // ),
    );
  }
}
