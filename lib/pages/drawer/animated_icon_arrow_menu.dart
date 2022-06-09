import 'package:flutter/material.dart';

class AnimatedIconArrowMenu extends StatefulWidget {
  final AnimatedIconData? animatedIconData;
  final double drawerWidth;
  final Widget? menuView;
  final ScrollController? scrollController;
  final AnimationController? iconAnimationController;
  const AnimatedIconArrowMenu(
      {Key? key,
      required this.scrollController,
      required this.menuView,
      required this.animatedIconData,
      required this.iconAnimationController,
      this.drawerWidth = 230})
      : super(key: key);

  @override
  State<AnimatedIconArrowMenu> createState() => _AnimatedIconArrowMenuState();
}

class _AnimatedIconArrowMenuState extends State<AnimatedIconArrowMenu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: MediaQuery.of(context).padding.top + 8, left: 8),
      child: SizedBox(
        width: AppBar().preferredSize.height - 8,
        height: AppBar().preferredSize.height - 8,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(AppBar().preferredSize.height),
            child: Center(
              // if u use ur own menu view UI you add form initialization
              child: widget.menuView != null
                  ? widget.menuView!
                  : AnimatedIcon(
                      icon: widget.animatedIconData ?? AnimatedIcons.arrow_menu,
                      progress: widget.iconAnimationController!),
            ),
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
              onDrawerClick();
            },
          ),
        ),
      ),
    );
  }

  void onDrawerClick() {
    //if scrollcontroller.offset != 0 then we set to closed the drawer(with animation to offset zero position) if is not 1 then open the drawer
    if (widget.scrollController!.offset != 0) {
      widget.scrollController?.animateTo(
        0,
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
      );
    } else {
      widget.scrollController?.animateTo(
        widget.drawerWidth,
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
      );
    }
  }
}
