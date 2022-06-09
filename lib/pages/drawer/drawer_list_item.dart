import 'package:flutter/material.dart';

import '/utils/constants.dart';
import 'drawer_list.dart';
import 'home_drawer.dart';

class DrawerListItem extends StatefulWidget {
  final AnimationController? iconAnimationController;
  final DrawerIndex? pageIndex;
  final DrawerList listData;
  final Function(DrawerIndex)? callBackIndex;
  const DrawerListItem({
    Key? key,
    required this.listData,
    required this.iconAnimationController,
    required this.pageIndex,
    required this.callBackIndex,
  }) : super(key: key);

  @override
  State<DrawerListItem> createState() => _DrawerListItemState();
}

class _DrawerListItemState extends State<DrawerListItem> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.grey.withOpacity(0.1),
        highlightColor: Colors.transparent,
        onTap: () {
          navigationtoPage(widget.listData.index!);
        },
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: <Widget>[
                  const SizedBox(
                    width: 6,
                    height: 46,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(6),
                  ),
                  widget.listData.isAssetsImage
                      ? SizedBox(
                          width: 24,
                          height: 24,
                          child: Image.asset(widget.listData.imageName,
                              color: widget.pageIndex == widget.listData.index
                                  ? kPrimaryColor
                                  : Colors.black45),
                        )
                      : Icon(widget.listData.icon?.icon,
                          color: widget.pageIndex == widget.listData.index
                              ? kPrimaryColor
                              : Colors.black45),
                  const Padding(
                    padding: EdgeInsets.all(6),
                  ),
                  Text(
                    widget.listData.labelName,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: widget.pageIndex == widget.listData.index
                          ? kPrimaryColor
                          : Colors.black45,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            widget.pageIndex == widget.listData.index
                ? AnimatedBuilder(
                    animation: widget.iconAnimationController!,
                    builder: (BuildContext context, Widget? child) {
                      return Transform(
                        transform: Matrix4.translationValues(
                            (MediaQuery.of(context).size.width * 0.75 - 64) *
                                (1 - widget.iconAnimationController!.value - 1),
                            0,
                            0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.75 -
                                55, //60
                            height: 46,
                            decoration: BoxDecoration(
                              // color: kSecondaryColor.withOpacity(0.5),
                              color: Colors.green.withOpacity(0.4),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(28),
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(28),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }

  Future<void> navigationtoPage(DrawerIndex indexPage) async {
    widget.callBackIndex!(indexPage);
  }
}
