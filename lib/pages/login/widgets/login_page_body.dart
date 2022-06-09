import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:real_estate/pages/login/widgets/background.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/components/already_have_account_check.dart';
import '/components/rounded_button.dart';
import '/components/rounded_input_field.dart';
import '/components/rounded_password_field.dart';
import '/pages/singup/singup_page.dart';
import '../../drawer/home_navigation.dart';

class LoginPageBody extends StatefulWidget {
  const LoginPageBody({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  String email = '';
  String password = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Background(
        child: isLoading
            ? const CircularProgressIndicator()
            : Column(
                children: <Widget>[
                  SizedBox(height: size.height * 0.1),
                  Image(
                    image: const AssetImage(
                      "assets/images/img.jpg",
                    ),
                    height: size.height * 0.2,
                  ),
                  SizedBox(height: size.height * 0.03),
                  RoundedInputField(
                    hintText: "Your Email",
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                  ),
                  RoundedPasswordField(
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                  RoundedButton(
                    text: "LOGIN",
                    onPressed: () {
                      if (email.isNotEmpty || password.isNotEmpty) {
                        setState(() {
                          isLoading = true;
                        });
                        signIn(email, password);
                      }
                    },
                  ),
                  SizedBox(height: size.height * 0.03),
                  AlreadyHaveAnAccountCheck(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const SignUpPage();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
      ),
    );
  }

  Future<void> signIn(String email, String password) async {
    final url =
        'https://odczone.com/api/auth/login?email=$email&password=$password';

    try {
      await http.post(Uri.parse(url)).then((response) async {
        setState(() {
          isLoading = false;
        });
        print('Initialize...');
        final responseData = json.decode(response.body);
        print(responseData);
        if (responseData['token'] == null) {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          responseData['message'].forEach((msg) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(msg),
            ));
          });
        } else {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Login Successfully!'),
          ));
          final prefs = await SharedPreferences.getInstance();
          prefs.setString('token', responseData['token']);
          prefs.setInt('id', responseData['account']['id']);

          Navigator.pushNamedAndRemoveUntil(
            context,
            NavigationHomePage.routeName,
            (route) => false,
          );
        }
      }).catchError((error) {
        setState(() {
          isLoading = false;
        });
        print('Error is: $error');
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Failed to Login!'),
        ));
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.toString()),
      ));
    }
  }
}
