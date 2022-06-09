import 'package:flutter/material.dart';

import '/components/rounded_button.dart';
import '/pages/payment/ad_cart_page.dart';
import 'payment_completion_page.dart';
import 'widgets/payment_list_item_widget.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({
    Key? key,
  }) : super(key: key);
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool _isMasterCardSelected = true;

  bool _isPayPalSelected = false;

  bool _isVisaSelected = false;

  bool _isCashSlected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Payment Method',
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: IconButton(
              icon: const Icon(
                Icons.add,
                size: 22,
              ),
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const AddCardPage(),
                  ),
                );
              },
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
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Choose one of the payment methods :',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      PaymentListItemWidget(
                        imgUrl: 'mastercard.jpg',
                        text: '**** **** 5684',
                        isSelected: _isMasterCardSelected,
                        onTap: () {
                          setState(() {
                            _isMasterCardSelected = true;
                            _isVisaSelected = false;
                            _isPayPalSelected = false;
                            _isCashSlected = false;
                          });
                        },
                      ),
                      PaymentListItemWidget(
                        imgUrl: 'visa.jpg',
                        text: '**** **** 3107',
                        isSelected: _isVisaSelected,
                        onTap: () {
                          setState(() {
                            _isMasterCardSelected = false;
                            _isVisaSelected = true;
                            _isPayPalSelected = false;
                            _isCashSlected = false;
                          });
                        },
                      ),
                      PaymentListItemWidget(
                        imgUrl: 'paypal.jpg',
                        text: 'DJ_Simon@Example.com',
                        isSelected: _isPayPalSelected,
                        onTap: () {
                          setState(() {
                            _isMasterCardSelected = false;
                            _isVisaSelected = false;
                            _isPayPalSelected = true;
                            _isCashSlected = false;
                          });
                        },
                      ),
                      PaymentListItemWidget(
                        imgUrl: 'cash.jpg',
                        text: 'Cash',
                        showArrow: false,
                        isSelected: _isCashSlected,
                        onTap: () {
                          setState(() {
                            _isMasterCardSelected = false;
                            _isVisaSelected = false;
                            _isPayPalSelected = false;
                            _isCashSlected = true;
                          });
                        },
                      ),
                      const Expanded(
                        child: SizedBox(
                          height: 20,
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: RoundedButton(
                          text: 'Confirm',
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
    );
  }
}
