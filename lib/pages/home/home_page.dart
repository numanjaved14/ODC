import 'package:flutter/material.dart';
import 'package:real_estate/models/properties.dart';
import 'package:real_estate/services/lang_pref.dart';
import 'package:real_estate/services/translator.dart';
import 'package:real_estate/utils/app_utils.dart';

import '/components/header.dart';
import '/components/most_visited_list_item.dart';
import '/components/nearby_lilst_item.dart';
import '/components/search_bar.dart';
import '/components/see_all_widget.dart';
import '/models/estate_list_data.dart';
import '/pages/home/all_estates_page.dart';
import '/pages/home/estate_detail_page.dart';
import '/utils/constants.dart';

class EstateHomePage extends StatefulWidget {
  const EstateHomePage({
    Key? key,
  }) : super(key: key);

  static const routeName = '/est_home-page';

  @override
  _EstateHomePageState createState() => _EstateHomePageState();
}

class _EstateHomePageState extends State<EstateHomePage> {
  List<EstateListData> estateList = EstateListData.estateList;
  late Future<Properties> _rentResidentialModel;
  late Future<Properties> _saleResidentialModel;
  late Future<Properties> _rentCommercialModel;
  late Future<Properties> _saleCommercialModel;

  String val1 = 'Select Language';
  String val2 = 'Residential';
  String val3 = 'Renting';
  String val4 = 'Selling';
  String val5 = 'Commercial';
  String val6 = 'Nearby Estates';
  String val7 = 'Let\'s find your paradise, Simon ?';
  bool _isFrench = false;

  @override
  void initState() {
    super.initState();
    getLnguage();
    _rentResidentialModel = AppUtils().getProperties('RR');
    _saleResidentialModel = AppUtils().getProperties('SR');
    _rentCommercialModel = AppUtils().getProperties('RC');
    _saleCommercialModel = AppUtils().getProperties('SC');
  }

  void getLnguage() async {
    String language = await LangPref.getLang();
    print("Output of Pref " + language);
    if (language == 'fr') {
      inFrench();
      setState(() {
        _isFrench = true;
      });
    } else {
      inEnglish();
      setState(() {
        _isFrench = false;
      });
    }
  }

  void inFrench() async {
    val1 = await trans.translate(val1);
    val2 = await trans.translate(val2);
    val3 = await trans.translate(val3);
    val4 = await trans.translate(val4);
    val5 = await trans.translate(val5);
    val6 = await trans.translate(val6);
    val7 = await trans.translate(val7);
    setState(() {
      val1;
      val2;
      val3;
      val4;
      val5;
      val6;
      val7;
    });
  }

  void inEnglish() async {
    val1 = await trans.translateToEng(val1);
    val2 = await trans.translateToEng(val2);
    val3 = await trans.translateToEng(val3);
    val4 = await trans.translateToEng(val4);
    val5 = await trans.translateToEng(val5);
    val6 = await trans.translateToEng(val6);
    setState(() {
      val1;
      val2;
      val3;
      val4;
      val5;
      val6;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1.6,
                child: Image.asset(
                  ('assets/images/background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Positioned(
            top: (MediaQuery.of(context).size.width / 1.6) - 24,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: kBoxShadow,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: (MediaQuery.of(context).size.width / 8.7),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14),
                      child: Card(
                        color: Colors.grey.shade100,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 14),
                              child: Text(
                                val1,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1.1,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    await LangPref.setLang('en');
                                    getLnguage();
                                  },
                                  child: Row(
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
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    await LangPref.setLang('fr');
                                    getLnguage();
                                  },
                                  child: Row(
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
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Header(),
                    SeeAllWidget(
                      seeAll: true,
                      title: val2,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const AllEstatesPage(),
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 14),
                      child: Text(
                        _isFrench ? val3 : 'Renting',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.1,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 300,
                      child: FutureBuilder<Properties>(
                          future: _rentResidentialModel,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data!.data!.length,
                                itemBuilder: (context, index) {
                                  var snap = snapshot.data!.data![index];
                                  return MostVisitedListItem(
                                    snap: snap,
                                    estateData: estateList[index],
                                    heroTag:
                                        'homeestate${estateList[index].imageUrl}',
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              EstateDetailsPage(
                                            estateData: estateList[index],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 14),
                      child: Text(
                        val4,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.1,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 300,
                      child: FutureBuilder<Properties>(
                          future: _saleResidentialModel,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data!.data!.length,
                                itemBuilder: (context, index) {
                                  var snap = snapshot.data!.data![index];
                                  return MostVisitedListItem(
                                    snap: snap,
                                    estateData: estateList[index],
                                    heroTag:
                                        'homeestate${estateList[index].imageUrl}',
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              EstateDetailsPage(
                                            estateData: estateList[index],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }),
                    ),
                    SeeAllWidget(
                      seeAll: true,
                      title: val5,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const AllEstatesPage(),
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 14),
                      child: Text(
                        _isFrench ? val3 : 'Renting',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.1,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 300,
                      child: FutureBuilder<Properties>(
                          future: _rentCommercialModel,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data!.data!.length,
                                itemBuilder: (context, index) {
                                  var snap = snapshot.data!.data![index];
                                  return MostVisitedListItem(
                                    snap: snap,
                                    estateData: estateList[index],
                                    heroTag:
                                        'homeestate${estateList[index].imageUrl}',
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              EstateDetailsPage(
                                            estateData: estateList[index],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 14),
                      child: Text(
                        val4,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.1,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 300,
                      child: FutureBuilder<Properties>(
                          future: _saleCommercialModel,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data!.data!.length,
                                itemBuilder: (context, index) {
                                  var snap = snapshot.data!.data![index];
                                  return MostVisitedListItem(
                                    snap: snap,
                                    estateData: estateList[index],
                                    heroTag:
                                        'homeestate${estateList[index].imageUrl}',
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              EstateDetailsPage(
                                            estateData: estateList[index],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }),
                    ),
                    // SeeAllWidget(
                    //   seeAll: true,
                    //   title: 'More Visited',
                    //   onPressed: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (BuildContext context) =>
                    //             const AllEstatesPage(),
                    //       ),
                    //     );
                    //   },
                    // ),
                    // SizedBox(
                    //   height: 300,
                    //   child: ListView.builder(
                    //     scrollDirection: Axis.horizontal,
                    //     itemCount: estateList.length,
                    //     itemBuilder: (context, index) {
                    //       return MostVisitedListItem(
                    //         estateData: estateList[index],
                    //         heroTag: 'homeestate${estateList[index].imageUrl}',
                    //         onTap: () {
                    //           Navigator.push(
                    //             context,
                    //             MaterialPageRoute(
                    //               builder: (BuildContext context) =>
                    //                   EstateDetailsPage(
                    //                 estateData: estateList[index],
                    //               ),
                    //             ),
                    //           );
                    //         },
                    //       );
                    //     },
                    //   ),
                    // ),
                    SeeAllWidget(
                      seeAll: true,
                      title: _isFrench ? val6 : 'Nearby Estates',
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: 140,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: estateList.length,
                        itemBuilder: (context, index) {
                          return NearbyListItem(
                            estateName: estateList[index].titleTxt,
                            imagePath: estateList[index].imageUrl,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: (MediaQuery.of(context).size.width / 2.1) - 30,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  _isFrench ? val7 : 'Let\'s find your paradise, Simon ?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SearchBar(
                  text: _isFrench ? 'chercher...' : 'Search...',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
