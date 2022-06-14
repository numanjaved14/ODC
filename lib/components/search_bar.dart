import 'package:flutter/material.dart';
import 'package:real_estate/pages/home/search_page.dart';

import '/utils/constants.dart';

class SearchBar extends StatefulWidget {
  String text;
  SearchBar({Key? key, this.text = 'Search...'}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(38),
                  ),
                  boxShadow: kBoxShadow,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: TextField(
                    onChanged: (String text) {},
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                    cursorColor: kPrimaryColor,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: widget.text,
                    ),
                    controller: _searchController,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            borderRadius: const BorderRadius.all(
              Radius.circular(32),
            ),
            onTap: () {
              FocusScope.of(context).unfocus();
              if (_searchController.text.isNotEmpty) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        SearchScreen(get: _searchController.text),
                  ),
                );
              }
            },
            child: const CircleAvatar(
              radius: 25,
              backgroundColor: kPrimaryColor,
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
