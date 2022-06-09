import 'package:flutter/material.dart';

import '/pages/drawer/sing_out_widget.dart';
import 'drawer_header.dart';
import 'drawer_list.dart';
import 'drawer_list_item.dart';

class HomeDrawer extends StatefulWidget {
  static const routeName = '/home-drawer';
  final AnimationController? iconAnimationController;
  final DrawerIndex? pageIndex;
  final Function(DrawerIndex)? callBackIndex;
  const HomeDrawer(
      {Key? key,
      this.pageIndex,
      this.iconAnimationController,
      this.callBackIndex})
      : super(key: key);

  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  List<DrawerList>? drawerList;

  @override
  void initState() {
    setDrawerListArray();
    super.initState();
  }

  void setDrawerListArray() {
    drawerList = <DrawerList>[
      DrawerList(
        index: DrawerIndex.home,
        labelName: 'Home',
        icon: const Icon(
          Icons.home,
        ),
      ),
      DrawerList(
        index: DrawerIndex.myFavorites,
        labelName: 'My Favorites',
        icon: const Icon(Icons.favorite),
      ),
      DrawerList(
        index: DrawerIndex.discover,
        labelName: 'Discover',
        icon: const Icon(
          Icons.explore,
        ),
      ),
      DrawerList(
        index: DrawerIndex.map,
        labelName: 'Map',
        icon: const Icon(Icons.edit_location_rounded),
      ),
      DrawerList(
        index: DrawerIndex.statistics,
        labelName: 'Statistics',
        icon: const Icon(Icons.bar_chart),
      ),
      DrawerList(
        index: DrawerIndex.blog,
        labelName: 'Our Blog',
        icon: const Icon(Icons.web),
      ),
      DrawerList(
        index: DrawerIndex.settings,
        labelName: 'Settings',
        icon: const Icon(
          Icons.settings,
        ),
      ),
      DrawerList(
        index: DrawerIndex.addProperty,
        labelName: 'Add Property',
        icon: const Icon(
          Icons.add,
        ),
      ),
      DrawerList(
        index: DrawerIndex.scanQrCode,
        labelName: 'Scan Qr Code & \nMake payment',
        icon: const Icon(
          Icons.qr_code,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          DrawerHeaderr(
              anIconAnimationController: widget.iconAnimationController),
          Divider(
            height: 10,
            color: Colors.black.withOpacity(0.6),
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: drawerList?.length,
              itemBuilder: (BuildContext context, int index) {
                return DrawerListItem(
                  callBackIndex: widget.callBackIndex!,
                  listData: drawerList![index],
                  iconAnimationController: widget.iconAnimationController!,
                  pageIndex: widget.pageIndex!,
                );
              },
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey.withOpacity(0.6),
          ),
          const SingOutWidget()
        ],
      ),
      // ),
    );
  }
}

enum DrawerIndex {
  home,
  myFavorites,
  discover,
  map,
  statistics,
  blog,
  settings,
  addProperty,
  scanQrCode
}
