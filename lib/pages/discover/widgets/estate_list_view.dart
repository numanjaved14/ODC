import 'package:flutter/material.dart';

import '/models/estate_list_data.dart';
import '/utils/constants.dart';
import 'item_footer.dart';

class EstateListView extends StatelessWidget {
  final VoidCallback? onTap;
  final EstateListData? estateData;
  final AnimationController? animationController;
  final Animation<double>? animation;

  const EstateListView(
      {Key? key,
      this.estateData,
      this.animationController,
      this.animation,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform:
                Matrix4.translationValues(0, 50 * (1 - animation!.value), 0),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
              child: InkWell(
                splashColor: Colors.transparent,
                onTap: onTap,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    boxShadow: kBoxShadow,
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    child: Stack(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            AspectRatio(
                              aspectRatio: 2,
                              child: Image.asset(
                                estateData!.imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                            ItemFooter(
                              estateData: estateData,
                            )
                          ],
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(32),
                              ),
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.all(8),
                                child: Icon(
                                  Icons.favorite_border,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
