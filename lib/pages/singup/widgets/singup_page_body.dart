import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:http/http.dart' as http;
import 'package:real_estate/pages/drawer/home_navigation.dart';
import 'package:real_estate/services/auth_methods.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/components/already_have_account_check.dart';
import '/components/rounded_button.dart';
import '/components/rounded_input_field.dart';
import '/components/rounded_password_field.dart';
import '/pages/login/login_page.dart';
import '/pages/singup/widgets/background.dart';
import '/pages/singup/widgets/or_divider.dart';

class SingupPageBody extends StatefulWidget {
  const SingupPageBody({
    Key? key,
  }) : super(key: key);

  @override
  State<SingupPageBody> createState() => _SingupPageBodyState();
}

class _SingupPageBodyState extends State<SingupPageBody> {
  String email = '';
  String password = '';
  bool isLoading = false;
  String? res;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Background(
        child: isLoading
            ? CircularProgressIndicator()
            : Column(
                children: <Widget>[
                  SizedBox(height: size.height * 0.1),
                  Image(
                    image: const AssetImage(
                      "assets/images/img.jpg",
                    ),
                    height: size.height * 0.2,
                  ),
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
                    text: "SIGNUP",
                    onPressed: () {
                      if (email.isNotEmpty || password.isNotEmpty) {
                        setState(() {
                          isLoading = true;
                        });
                        signUp(email, password, 'Agent', 'John', 'Smith');
                      }
                    },
                  ),
                  SizedBox(height: size.height * 0.03),
                  AlreadyHaveAnAccountCheck(
                    login: false,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const LoginPage();
                          },
                        ),
                      );
                    },
                  ),
                  const OrDivider(),
                  Column(
                    children: <Widget>[
                      SignInButton(
                        Buttons.Facebook,
                        onPressed: () {},
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: SignInButton(
                          Buttons.Google,
                          onPressed: () async {
                            res =
                                await FirebaseAuthMethods(FirebaseAuth.instance)
                                    .signInWithGoogle(context);
                            if (res == 'success') {
                              ScaffoldMessenger.of(context)
                                  .removeCurrentSnackBar();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text('Register Successfully!'),
                              ));

                              // final prefs =
                              //     await SharedPreferences.getInstance();
                              // prefs.setString('token', responseData['token']);
                              // prefs.setInt('id', responseData['user']['id']);

                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                NavigationHomePage.routeName,
                                (route) => false,
                              );
                            } else {
                              ScaffoldMessenger.of(context)
                                  .removeCurrentSnackBar();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text('Failed to register!'),
                              ));
                            }
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
      ),
    );
  }

  Future<void> signUp(String email, String password, String role,
      String first_name, String last_name) async {
    final url =
        'https://odczone.com/api/auth/register?email=$email&password=$password&role=$role&first_name=$first_name&last_name=$last_name';
    try {
      await http.post(Uri.parse(url)).then((response) async {
        setState(() {
          isLoading = false;
        });
        print('Initialize...');
        final responseData = json.decode(response.body);
        print(responseData);
        if (responseData['success'] == true) {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Register Successfully!'),
          ));

          final prefs = await SharedPreferences.getInstance();
          prefs.setString('token', responseData['token']);
          prefs.setInt('id', responseData['user']['id']);

          Navigator.pushNamedAndRemoveUntil(
            context,
            NavigationHomePage.routeName,
            (route) => false,
          );
        } else {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Failed to register!'),
          ));
        }
      }).catchError((error) {
        setState(() {
          isLoading = false;
        });
        print('Error is $error');
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Failed to register!'),
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
