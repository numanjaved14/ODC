import 'package:flutter/material.dart';
import 'package:real_estate/pages/login/widgets/background.dart';
import 'package:real_estate/utils/app_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/pages/welcome/widgets/welcome_page_body.dart';
import '../drawer/home_navigation.dart';

class WelcomePage extends StatefulWidget {
  static const routeName = '/welcome-page';

  const WelcomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool isLoading = true;

  @override
  void initState() {
    print(AppUtils.getRandomString(6));
    autoLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: isLoading
            ? const CircularProgressIndicator()
            : const WelcomePageBody(),
      ),
    );
  }

  Future<void> autoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('token')) {
      print('User Already Login...');
      print(prefs.getString('token'));
      print(prefs.getInt('id'));
      Navigator.pushNamedAndRemoveUntil(
        context,
        NavigationHomePage.routeName,
        (route) => false,
      );
    } else {
      print('User Not Login...');
      setState(() {
        isLoading = false;
      });
    }
  }
}
