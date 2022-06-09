import 'package:flutter/material.dart';

import '../drawer/home_navigation.dart';
import 'widgets/favorite_widget.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({
    Key? key,
  }) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 30,
        elevation: 0,
      ),
      body: WillPopScope(
        onWillPop: _onWillPop,
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: FavoriteWidget(),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to exit this page?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  NavigationHomePage.routeName,
                  (route) => false,
                ),
                child: const Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }
}
