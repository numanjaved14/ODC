import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '/models/estate_list_data.dart';
import '/pages/discover/widgets/estate_list_view.dart';
import '/pages/home/estate_detail_page.dart';
import '/pages/discover/widgets/filter_bar.dart';
import '/components/header.dart';
import '/components/search_bar.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({
    Key? key,
  }) : super(key: key);
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  List<EstateListData> estateList = EstateListData.estateList;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Discover',
          ),
        ),
        automaticallyImplyLeading: false,
        actions: const [
          Icon(
            FontAwesomeIcons.mapMarkerAlt,
            color: Colors.white,
            size: 18,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Icon(
              Icons.notifications,
              color: Colors.white,
              size: 22,
            ),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Column(
              children: <Widget>[
                Expanded(
                  child: NestedScrollView(
                    controller: _scrollController,
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                            return Column(
                              children: const <Widget>[
                                SearchBar(),
                                Header(),
                              ],
                            );
                          }, childCount: 1),
                        ),
                        SliverPersistentHeader(
                          pinned: true,
                          floating: true,
                          delegate: ContestTabHeader(
                            const FilterBar(),
                          ),
                        ),
                      ];
                    },
                    body: Container(
                      color: Colors.white,
                      child: ListView.builder(
                        itemCount: estateList.length,
                        padding: const EdgeInsets.only(top: 8),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          final int count =
                              estateList.length > 10 ? 10 : estateList.length;
                          final Animation<double> animation =
                              Tween<double>(begin: 0, end: 1).animate(
                            CurvedAnimation(
                              parent: animationController!,
                              curve: Interval((1 / count) * index, 1,
                                  curve: Curves.fastOutSlowIn),
                            ),
                          );
                          animationController?.forward();
                          return EstateListView(
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
                            estateData: estateList[index],
                            animation: animation,
                            animationController: animationController!,
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      // ),
    );
  }
}

class ContestTabHeader extends SliverPersistentHeaderDelegate {
  ContestTabHeader(
    this.widget,
  );
  final Widget widget;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return widget;
  }

  @override
  double get maxExtent => 52;

  @override
  double get minExtent => 52;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
