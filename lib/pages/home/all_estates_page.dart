import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '/models/estate_list_data.dart';
import '/pages/payment/widgets/check_out_list_item.dart';

class AllEstatesPage extends StatefulWidget {
  const AllEstatesPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AllEstatesPage> createState() => _AllEstatesPageState();
}

class _AllEstatesPageState extends State<AllEstatesPage> {
  List<EstateListData> estateList = [];
  bool isLoading = true;
  String _type = 'All';
  List types = [
    'All',
    "Sale",
    "Rent",
  ];

  @override
  void initState() {
    fetchAllEstates();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('Initialize');
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'All Estates',
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          Container(
            height: 45,
            width: 100,
            alignment: Alignment.center,
            child: DropdownButton(
              iconEnabledColor: Colors.white,
              dropdownColor: Colors.black,
              isExpanded: true,
              underline: Container(),
              value: _type,
              onChanged: (newValue) {
                estateList = [];
                setState(() {
                  isLoading = true;
                  _type = newValue.toString();
                });
                fetchAllEstates();
              },
              items: types.map<DropdownMenuItem<String>>(
                (value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        value,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ],
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              // physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(10),
              itemCount: estateList.length,
              itemBuilder: (BuildContext context, int index) {
                return CheckOutListItem(
                  estateData: estateList[index],
                );
              },
            ),
    );
  }

  Future<void> fetchAllEstates() async {
    String url;

    if (_type == 'All') {
      print('Call 1');
      url = 'https://odczone.com/api/properties/get';
      try {
        await http.get(Uri.parse(url)).then((estateListData) {
          final responseData = json.decode(estateListData.body);
          responseData['properties']['data'].forEach((estateData) {
            setState(() {
              estateList.add(
                EstateListData(
                  id: estateData['id'].toString(),
                  imageUrl: 'assets/images/estate_1.jpg',
                  titleTxt: estateData['name'],
                  subTxt: 'Kensington, NY',
                  distance: 2,
                  reviews: 71,
                  rating: 4.4,
                  perMonth: 165,
                  lordLandName: 'Joan Li',
                  lordLandImage: 'assets/images/Joan.jpg',
                ),
              );
              isLoading = false;
            });
          });
        }).catchError((error) {
          setState(() {
            isLoading = false;
          });
          print('Error 1 is: $error');
        });
      } catch (error) {
        setState(() {
          isLoading = false;
        });
        rethrow;
      }
    } else {
      print('Call 2');
      url = 'https://odczone.com/api/properties/byType?type=$_type';
      try {
        await http.post(Uri.parse(url)).then((estateListData) {
          final responseData = json.decode(estateListData.body);
          responseData['properties'].forEach((estateData) {
            setState(() {
              estateList.add(
                EstateListData(
                  id: estateData['id'].toString(),
                  imageUrl: 'assets/images/estate_1.jpg',
                  titleTxt: estateData['name'],
                  subTxt: 'Kensington, NY',
                  distance: 2,
                  reviews: 71,
                  rating: 4.4,
                  perMonth: 165,
                  lordLandName: 'Joan Li',
                  lordLandImage: 'assets/images/Joan.jpg',
                ),
              );
              isLoading = false;
            });
          });
        }).catchError((error) {
          setState(() {
            isLoading = false;
          });
          print('Error 2 is: $error');
        });
      } catch (error) {
        setState(() {
          isLoading = false;
        });
        rethrow;
      }
    }
  }
}
