import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

import '/pages/drawer/home_navigation.dart';
import '/components/rounded_button.dart';
import '/utils/constants.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({Key? key}) : super(key: key);
  @override
  _OtpVerificationPageState createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  String text = '';

  void _onKeyboardTap(String value) {
    setState(() {
      text = text + value;
    });
  }

  Widget otpNumberWidget(int position) {
    try {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Center(
            child: Text(
          text[position],
          style: const TextStyle(color: Colors.black),
        )),
      );
    } catch (e) {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: kPrimaryColor,
        ),
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            // Expanded(
            //  child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                'Enter 6 digits verification code sent to your number',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  otpNumberWidget(0),
                  otpNumberWidget(1),
                  otpNumberWidget(2),
                  otpNumberWidget(3),
                  otpNumberWidget(4),
                  otpNumberWidget(5),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: RoundedButton(
                text: 'Confirm',
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
            ),
            NumericKeyboard(
              onKeyboardTap: _onKeyboardTap,
              textColor: kPrimaryColor.withOpacity(0.4),
              rightIcon: Icon(
                Icons.backspace,
                color: kPrimaryColor.withOpacity(0.4),
              ),
              rightButtonFn: () {
                setState(() {
                  text = text.substring(0, text.length - 1);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
