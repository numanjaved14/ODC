import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:real_estate/pages/home/estate_detail_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/models/estate_list_data.dart';
import '/utils/constants.dart';

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({
    Key? key,
  }) : super(key: key);

  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool isLoading = true;
  String? userId;

  @override
  void initState() {
    fetchFavouriteEstates();
    super.initState();
  }

  List<EstateListData> estateList = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : GridView.builder(
            itemCount: estateList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.6,
              crossAxisSpacing: size.width * 0.075,
              mainAxisSpacing: size.height * 0.0,
            ),
            padding: const EdgeInsets.all(16),
            itemBuilder: (BuildContext context, int index) {
              return myGridItems(
                  gridImage: estateList[index].imageUrl,
                  duration: estateList[index].subTxt,
                  gridName: estateList[index].titleTxt,
                  id: estateList[index].id,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return EstateDetailsPage(
                            estateData: estateList[index],
                          );
                        },
                      ),
                    );
                  });
            });
  }

  Widget myGridItems({
    required String? gridName,
    required String? gridImage,
    required String? duration,
    required VoidCallback? onTap,
    required String? id,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage(
                        gridImage!,
                      ),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.favorite),
                    iconSize: 24,
                    color: kPrimaryColor.withOpacity(0.7),
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      final url =
                          'https://odczone.com/api/properties/remove-favourite?properties_id=$id';
                      try {
                        await http.post(Uri.parse(url)).then((estateListData) {
                          setState(() {
                            isLoading = false;
                          });
                          fetchFavouriteEstates();
                          final responseData = json.decode(estateListData.body);
                          ScaffoldMessenger.of(context).removeCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('${responseData["message"]}'),
                          ));
                        }).catchError((error) {
                          print('Error 1 is: $error');
                          setState(() {
                            isLoading = false;
                          });
                          ScaffoldMessenger.of(context).removeCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(error),
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
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    gridName!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: kPrimaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    duration!,
                    style: const TextStyle(
                      color: kPrimaryColor,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> fetchFavouriteEstates() async {
    String url;
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getInt('id').toString();
    });
    estateList = [];
    url = 'https://odczone.com/api/properties/favourites?user_id=$userId';
    try {
      await http.get(Uri.parse(url)).then((estateListData) {
        setState(() {
          isLoading = false;
        });
        final responseData = json.decode(estateListData.body);
        responseData['favourites'].forEach((estateData) {
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
  }
}
