import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/components/rounded_input_field.dart';
import '/components/rounded_button.dart';
import '/utils/constants.dart';
import 'otp_verification_page.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: size.height * 0.03),
              Container(
                constraints: const BoxConstraints(maxHeight: 300),
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Image.asset('assets/images/otp.png'),
              ),
              const Text(
                'Forgot password?',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'We will send you an ',
                        style: TextStyle(
                          color: kPrimaryColor,
                        ),
                      ),
                      TextSpan(
                        text: 'One Time Password ',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'on this mobile number',
                        style: TextStyle(
                          color: kPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: RoundedInputField(
                  hintText: "+33....",
                  icon: Icons.phone,
                  textInputType: TextInputType.phone,
                  onChanged: (value) {},
                ),
              ),
              RoundedButton(
                text: 'Next',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const OtpVerificationPage();
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
