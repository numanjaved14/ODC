import 'dart:convert';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:real_estate/components/rounded_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_utils.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  bool isLoading = false;
  int? userId;
  TextEditingController _name = TextEditingController();
  String? _type;
  TextEditingController _description = TextEditingController();
  String? _city;
  TextEditingController _location = TextEditingController();
  TextEditingController _latitude = TextEditingController();
  TextEditingController _longitude = TextEditingController();
  String? _bedRooms;
  String? _bathrooms;
  String? _floors;
  TextEditingController _price = TextEditingController();
  String? _currency;
  String? imgPath;

  @override
  void initState() {
    getId();
    super.initState();
  }

  List types = [
    "Sale",
    "Rent",
  ];

  List cities = [
    "Q",
    "A",
    "V",
    "K",
  ];

  List bedroomsBathroomsFloors = [
    "1",
    "2",
    "3",
    "4",
  ];

  List currencies = [
    "USD",
    "EUR",
    "VND",
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 30,
          elevation: 0,
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: const [
                            Text(
                              'Title',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 6),
                              child: Icon(
                                Icons.star,
                                color: Colors.red,
                                size: 10,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: _name,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(10, 2, 0, 2),
                            hintText: 'Title',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: const [
                            Text(
                              'Type',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 6),
                              child: Icon(
                                Icons.star,
                                color: Colors.red,
                                size: 10,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: DropdownButton(
                            isExpanded: true,
                            underline: Container(),
                            value: _type,
                            onChanged: (newValue) {
                              setState(() {
                                _type = newValue.toString();
                              });
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
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Description',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          color: Colors.grey.shade200,
                          child: TextFormField(
                            controller: _description,
                            minLines: 2,
                            maxLines: 5,
                            keyboardType: TextInputType.multiline,
                            decoration: const InputDecoration(
                              hintText: 'short description',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'File',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: _getFromGallery,
                          child: DottedBorder(
                            strokeWidth: 1,
                            color: Colors.lightBlueAccent,
                            child: Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.grey.shade200,
                              child: Center(
                                child: Text(
                                  imgPath ?? 'click to upload file here',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Text('City',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 5),
                        Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: DropdownButton(
                            isExpanded: true,
                            underline: Container(),
                            value: _city,
                            onChanged: (newValue) {
                              setState(() {
                                _city = newValue.toString();
                              });
                            },
                            items: cities.map<DropdownMenuItem<String>>(
                              (value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      value,
                                      style: const TextStyle(
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: const [
                            Text(
                              'Property Location',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 6),
                              child: Icon(
                                Icons.star,
                                color: Colors.red,
                                size: 10,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: _location,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(10, 2, 0, 2),
                            hintText: 'Property Location',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Latitude',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: _latitude,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(10, 2, 0, 2),
                            hintText: 'Ex: 1.46232313',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Longitude',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: _longitude,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(10, 2, 0, 2),
                            hintText: 'Ex: 1.46232313',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Number of BedRooms',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: DropdownButton(
                            isExpanded: true,
                            underline: Container(),
                            value: _bedRooms,
                            onChanged: (newValue) {
                              setState(() {
                                _bedRooms = newValue.toString();
                              });
                            },
                            items: bedroomsBathroomsFloors
                                .map<DropdownMenuItem<String>>(
                              (value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      value,
                                      style: const TextStyle(
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Number of BathRooms',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: DropdownButton(
                            isExpanded: true,
                            underline: Container(),
                            value: _bathrooms,
                            onChanged: (newValue) {
                              setState(() {
                                _bathrooms = newValue.toString();
                              });
                            },
                            items: bedroomsBathroomsFloors
                                .map<DropdownMenuItem<String>>(
                              (value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      value,
                                      style: const TextStyle(
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Number of Floors',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: DropdownButton(
                            isExpanded: true,
                            underline: Container(),
                            value: _floors,
                            onChanged: (newValue) {
                              setState(() {
                                _floors = newValue.toString();
                              });
                            },
                            items: bedroomsBathroomsFloors
                                .map<DropdownMenuItem<String>>(
                              (value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      value,
                                      style: const TextStyle(
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Price',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: _price,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(10, 2, 0, 2),
                            hintText: 'Price',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Currency',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: DropdownButton(
                            isExpanded: true,
                            underline: Container(),
                            value: _currency,
                            onChanged: (newValue) {
                              setState(() {
                                _currency = newValue.toString();
                              });
                            },
                            items: currencies.map<DropdownMenuItem<String>>(
                              (value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      value,
                                      style: const TextStyle(
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Center(
                          child: Text(
                            'Language',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/ame.png',
                                  scale: 40,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  'English',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/fr.png',
                                  scale: 45,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  'French',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: RoundedButton(
                            text: "SUBMIT",
                            onPressed: () async {
                              if (imgPath == null) {
                                ScaffoldMessenger.of(context)
                                    .removeCurrentSnackBar();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Please Select Image')));
                                return;
                              }

                              setState(() {
                                isLoading = true;
                              });

                              const url =
                                  'https://odczone.com/api/properties/create';
                              var request =
                                  http.MultipartRequest("POST", Uri.parse(url));
                              try {
                                request.fields['property_id'] =
                                    AppUtils.getRandomString(6);
                                request.fields['name'] = _name.text;
                                request.fields['description'] =
                                    _description.text;
                                request.fields['content'] = _description.text;
                                request.fields['price'] = _price.text;
                                request.fields['city_id'] = _city!;
                                request.fields['type'] = _type!;
                                request.fields['author_id'] = userId.toString();
                                request.fields['number_bathroom'] = _bathrooms!;
                                request.fields['number_bedroom'] = _bedRooms!;
                                request.fields['number_floor'] = _floors!;
                                request.fields['square'] = '400';
                                request.fields['price_unit'] = _currency!;
                                request.fields['currency_id'] = _currency!;
                                request.fields['location'] = _location.text;
                                request.fields['latitude'] = _latitude.text;
                                request.fields['longitude'] = _longitude.text;
                                request.fields['period'] = 'month';
                                request.fields['status'] = 'selling';
                                request.files.add(
                                  await http.MultipartFile.fromPath(
                                    'images',
                                    imgPath!,
                                  ),
                                );

                                print(jsonEncode(request.fields));

                                request.send().then((response) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  print(response.statusCode);
                                  print(response.stream
                                      .transform(utf8.decoder)
                                      .listen((msg) {
                                    print(msg);

                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content:
                                          Text(json.decode(msg)['message']),
                                    ));
                                  }));
                                }).catchError((error) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  ScaffoldMessenger.of(context)
                                      .removeCurrentSnackBar();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(error)));
                                  print(error);
                                });
                              } catch (error) {
                                setState(() {
                                  isLoading = false;
                                });
                                ScaffoldMessenger.of(context)
                                    .removeCurrentSnackBar();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(error.toString())));
                                print(error);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  /// Get from gallery
  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imgPath = pickedFile.path;
      });

      print(File(pickedFile.path));
      print(pickedFile.path);
    }
  }

  Future<void> getId() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getInt('id');
    });
  }
}
