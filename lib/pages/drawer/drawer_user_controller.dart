import 'package:flutter/material.dart';

import '/pages/drawer/animated_icon_arrow_menu.dart';
import 'home_drawer.dart';

class DrawerUserController extends StatefulWidget {
  final double drawerWidth;
  final Function(DrawerIndex)? onDrawerCall;
  final Widget? pageView;
  final Function(bool)? drawerIsOpen;
  final AnimatedIconData? animatedIconData;
  final Widget? menuView;
  final DrawerIndex? pageIndex;

  const DrawerUserController({
    Key? key,
    this.drawerWidth = 230,
    this.onDrawerCall,
    this.pageView,
    this.animatedIconData = AnimatedIcons.arrow_menu,
    this.menuView,
    this.drawerIsOpen,
    this.pageIndex,
  }) : super(key: key);

  @override
  _DrawerUserControllerState createState() => _DrawerUserControllerState();
}

class _DrawerUserControllerState extends State<DrawerUserController>
    with TickerProviderStateMixin {
  ScrollController? scrollController;
  AnimationController? iconAnimationController;
  AnimationController? animationController;

  double scrolloffset = 0;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    iconAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 0));
    iconAnimationController?.animateTo(1,
        duration: const Duration(milliseconds: 0), curve: Curves.fastOutSlowIn);
    scrollController =
        ScrollController(initialScrollOffset: widget.drawerWidth);
    scrollController!.addListener(() {
      if (scrollController!.offset <= 0) {
        if (scrolloffset != 1) {
          setState(() {
            scrolloffset = 1;
            try {
              widget.drawerIsOpen!(true);
            } catch (_) {}
          });
        }
        iconAnimationController?.animateTo(0,
            duration: const Duration(milliseconds: 0),
            curve: Curves.fastOutSlowIn);
      } else if (scrollController!.offset > 0 &&
          scrollController!.offset < widget.drawerWidth.floor()) {
        iconAnimationController?.animateTo(
            (scrollController!.offset * 100 / (widget.drawerWidth)) / 100,
            duration: const Duration(milliseconds: 0),
            curve: Curves.fastOutSlowIn);
      } else {
        if (scrolloffset != 0) {
          setState(() {
            scrolloffset = 0;
            try {
              widget.drawerIsOpen!(false);
            } catch (_) {}
          });
        }
        iconAnimationController?.animateTo(1,
            duration: const Duration(milliseconds: 0),
            curve: Curves.fastOutSlowIn);
      }
    });
    WidgetsBinding.instance?.addPostFrameCallback((_) => getInitState());
    super.initState();
  }

  Future<bool> getInitState() async {
    scrollController?.jumpTo(
      widget.drawerWidth,
    );
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        physics: const PageScrollPhysics(parent: ClampingScrollPhysics()),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width + widget.drawerWidth,
          //we use Page width and add drawerWidth (from Page)
          child: Row(
            children: <Widget>[
              SizedBox(
                width: widget.drawerWidth,
                //we divided first drawer Width with HomeDrawer and second full-screen Width with all home Page, we called Page View
                height: MediaQuery.of(context).size.height,
                child: AnimatedBuilder(
                  animation: iconAnimationController!,
                  builder: (BuildContext context, Widget? child) {
                    return Transform(
                      //transform we use for the stable drawer  we don't need to move with scroll view
                      transform: Matrix4.translationValues(
                          scrollController!.offset, 0, 0),
                      child: HomeDrawer(
                        pageIndex: widget.pageIndex == null
                            ? DrawerIndex.home
                            : widget.pageIndex!,
                        iconAnimationController: iconAnimationController,
                        callBackIndex: (DrawerIndex indexType) {
                          onDrawerClick();
                          try {
                            widget.onDrawerCall!(indexType);
                          } catch (e) {
                            //print(e);
                          }
                        },
                      ),
                    );
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                //full-screen Width with widget.pageView
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      blurRadius: 24,
                    ),
                  ],
                ),
                child: Stack(
                  children: <Widget>[
                    //we use IgnorePointer as touch widget.PageView,
                    IgnorePointer(
                      ignoring: scrolloffset == 1 || false,
                      child: widget.pageView,
                    ),
                    if (scrolloffset == 1)
                      InkWell(
                        onTap: () {
                          onDrawerClick();
                        },
                      ),
                    AnimatedIconArrowMenu(
                      // the menu and arrowBack icon animation
                      scrollController: scrollController,
                      animatedIconData: widget.animatedIconData,
                      menuView: widget.menuView,
                      iconAnimationController: iconAnimationController,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onDrawerClick() {
    //if scrollcontroller.offset != 0 then we set the  drawer closed (with animation to offset zero position) if is not 1 then open the drawer
    if (scrollController!.offset != 0) {
      scrollController?.animateTo(
        0,
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
      );
    } else {
      scrollController?.animateTo(
        widget.drawerWidth,
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
      );
    }
  }
}
