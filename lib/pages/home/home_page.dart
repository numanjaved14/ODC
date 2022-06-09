import 'package:flutter/material.dart';

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
                  children: [
                    SizedBox(
                      height: (MediaQuery.of(context).size.width / 8.7),
                    ),
                    const Header(),
                    SeeAllWidget(
                      seeAll: true,
                      title: 'Residential',
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
                    Text(
                      'Renting',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.1,
                      ),
                    ),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: estateList.length,
                        itemBuilder: (context, index) {
                          return MostVisitedListItem(
                            estateData: estateList[index],
                            heroTag: 'homeestate${estateList[index].imageUrl}',
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
                      ),
                    ),
                    Text(
                      'Selling',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.1,
                      ),
                    ),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: estateList.length,
                        itemBuilder: (context, index) {
                          return MostVisitedListItem(
                            estateData: estateList[index],
                            heroTag: 'homeestate${estateList[index].imageUrl}',
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
                      ),
                    ),
                    SeeAllWidget(
                      seeAll: true,
                      title: 'Commercial',
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
                    Text(
                      'Renting',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.1,
                      ),
                    ),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: estateList.length,
                        itemBuilder: (context, index) {
                          return MostVisitedListItem(
                            estateData: estateList[index],
                            heroTag: 'homeestate${estateList[index].imageUrl}',
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
                      ),
                    ),
                    Text(
                      'Selling',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.1,
                      ),
                    ),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: estateList.length,
                        itemBuilder: (context, index) {
                          return MostVisitedListItem(
                            estateData: estateList[index],
                            heroTag: 'homeestate${estateList[index].imageUrl}',
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
                      ),
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
                      title: 'Nearby Estates',
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
              children: const [
                Text(
                  'Let\'s find your paradise, Simon ?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SearchBar(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
