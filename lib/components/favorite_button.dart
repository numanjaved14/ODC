import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/utils/constants.dart';
import 'package:http/http.dart' as http;

class FavoriteButton extends StatefulWidget {
  final AnimationController? animationController;
  final String? propertyId;

  FavoriteButton({
    required this.animationController,
    required this.propertyId,
  });

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  String? accountId;

  @override
  void initState() {
    setUserId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: (MediaQuery.of(context).size.width / 1.2) - 59,
      right: 38,
      child: ScaleTransition(
        alignment: Alignment.center,
        scale: CurvedAnimation(
          parent: widget.animationController!,
          curve: Curves.fastOutSlowIn,
        ),
        child: Material(
          borderRadius: BorderRadius.circular(32),
          elevation: 6,
          child: GestureDetector(
            onTap: () {
              addToFav();
            },
            child: const CircleAvatar(
              backgroundColor: kPrimaryColor,
              radius: 32,
              child: Icon(
                Icons.favorite,
                color: Colors.white,
                size: 36,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void addToFav() async {
    print(widget.propertyId);
    print(accountId);
    final url =
        'https://odczone.com/api/properties/add-favourite?properties_id=${widget.propertyId}&accounts_id=$accountId';
    try {
      await http.post(Uri.parse(url)).then((estateListData) {
        final responseData = json.decode(estateListData.body);
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${responseData["message"]}'),
        ));
      }).catchError((error) {
        print('Error 1 is: $error');
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(error),
        ));
      });
    } catch (error) {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.toString()),
      ));
    }
  }

  void setUserId() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      accountId = prefs.getInt('id').toString();
    });
  }
}
