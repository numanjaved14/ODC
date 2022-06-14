import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:real_estate/pages/drawer/home_navigation.dart';
import 'package:real_estate/pages/home/home_page.dart';
import 'package:real_estate/pages/splash/splash_page.dart';
import 'package:real_estate/pages/welcome/welcome_page.dart';
import 'package:real_estate/services/lang_pref.dart';
import 'package:real_estate/utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await LangPref.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: kPrimaryColor,
        ),
      ),
      home: SplashPage(),
      routes: {
        EstateHomePage.routeName: (ctx) => EstateHomePage(),
        NavigationHomePage.routeName: (ctx) => NavigationHomePage(),
        WelcomePage.routeName: (ctx) => WelcomePage(),
      },
    );
  }
}
