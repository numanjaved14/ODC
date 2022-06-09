import 'package:flutter/material.dart';

import '/utils/constants.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

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
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search...',
                    ),
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
