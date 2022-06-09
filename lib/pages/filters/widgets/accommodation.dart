import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/models/popular_filter_list.dart';
import '/utils/constants.dart';

class Accommodation extends StatefulWidget {
  const Accommodation({Key? key}) : super(key: key);

  @override
  State<Accommodation> createState() => _AccommodationState();
}

class _AccommodationState extends State<Accommodation> {
  List<PopularFilterListData> accommodationListData =
      PopularFilterListData.accommodationList;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 10),
          child: Text(
            'Accommodation\'s Type',
            style: kSubTitle2Style,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: getAccomodationListUI(),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }

  List<Widget> getAccomodationListUI() {
    final List<Widget> noList = <Widget>[];
    for (int i = 0; i < accommodationListData.length; i++) {
      final PopularFilterListData date = accommodationListData[i];
      noList.add(
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            onTap: () {
              setState(() {
                checkAppPosition(i);
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      date.titleText,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                  CupertinoSwitch(
                    activeColor: date.isSelected
                        ? kSecondaryColor
                        : Colors.grey.withOpacity(0.6),
                    onChanged: (bool value) {
                      setState(() {
                        checkAppPosition(i);
                      });
                    },
                    value: date.isSelected,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      if (i == 0) {
        noList.add(const Divider(
          height: 1,
        ));
      }
    }
    return noList;
  }

  void checkAppPosition(int index) {
    if (index == 0) {
      if (accommodationListData[0].isSelected) {
        for (var d in accommodationListData) {
          d.isSelected = false;
        }
      } else {
        for (var d in accommodationListData) {
          d.isSelected = true;
        }
      }
    } else {
      accommodationListData[index].isSelected =
          !accommodationListData[index].isSelected;

      int count = 0;
      for (int i = 0; i < accommodationListData.length; i++) {
        if (i != 0) {
          final PopularFilterListData data = accommodationListData[i];
          if (data.isSelected) {
            count += 1;
          }
        }
      }
      if (count == accommodationListData.length - 1) {
        accommodationListData[0].isSelected = true;
      } else {
        accommodationListData[0].isSelected = false;
      }
    }
  }
}
