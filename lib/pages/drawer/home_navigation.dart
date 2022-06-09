import 'package:flutter/material.dart';
import 'package:real_estate/pages/form/form.dart';
import 'package:real_estate/pages/qrcode/qrcode.dart';
import 'package:real_estate/utils/app_utils.dart';

import '/pages/discover/discover_page.dart';
import '/pages/favorite/favorite_page.dart';
import '/pages/home/home_page.dart';
import 'drawer_user_controller.dart';
import 'home_drawer.dart';

class NavigationHomePage extends StatefulWidget {
  static const routeName = '/navigation-home-page';

  const NavigationHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _NavigationHomePageState createState() => _NavigationHomePageState();
}

class _NavigationHomePageState extends State<NavigationHomePage> {
  Widget? pageView;
  DrawerIndex? drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.home;
    pageView = const EstateHomePage();
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white24,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: DrawerUserController(
            pageIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace Page as user need with passing DrawerIndex(Enum index)
            },
            pageView: pageView,
            //we replace Page view as we need on navigate starting Pages like MyHomePage, HelpPage, etc...
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.home) {
        setState(() {
          pageView = const EstateHomePage();
        });
      } else if (drawerIndex == DrawerIndex.myFavorites) {
        setState(() {
          pageView = const FavoritePage();
        });
      } else if (drawerIndex == DrawerIndex.discover) {
        setState(() {
          pageView = const DiscoverPage();
        });
      } else if (drawerIndex == DrawerIndex.map) {
        setState(() {
          //  PageView = mapPage();
        });
      } else if (drawerIndex == DrawerIndex.statistics) {
        setState(() {
          //  PageView = statisticsPage();
        });
      } else if (drawerIndex == DrawerIndex.blog) {
        setState(() {
          //  PageView = InviteFriend();
        });
      }
      // else if (drawerIndex == DrawerIndex.settings) {
      //   setState(() {
      //     pageView = const Settingspage();
      //   });
      // }
      else if (drawerIndex == DrawerIndex.addProperty) {
        setState(() {
          pageView = FormPage();
        });
      } else if (drawerIndex == DrawerIndex.scanQrCode) {
        setState(() {
          pageView = QrCode();
        });
      }
    }
  }

  void getUser() {
    print(AppUtils.getCurrentUser());
  }
}
