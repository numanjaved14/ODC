import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:real_estate/utils/app_utils.dart';

import '/pages/profile/profile_page.dart';
import '/utils/constants.dart';

class DrawerHeaderr extends StatefulWidget {
  final AnimationController? anIconAnimationController;
  const DrawerHeaderr({
    Key? key,
    required this.anIconAnimationController,
  }) : super(key: key);

  @override
  State<DrawerHeaderr> createState() => _DrawerHeaderrState();
}

class _DrawerHeaderrState extends State<DrawerHeaderr> {
  String name = '';
  String email = '';

  @override
  void initState() {
    AppUtils.getCurrentUser().then((user) {
      setState(() {
        name = '${user.first_name} ${user.last_name}';
        email = '${user.email}';
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 58, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AnimatedBuilder(
            animation: widget.anIconAnimationController!,
            builder: (BuildContext context, Widget? child) {
              return ScaleTransition(
                scale: AlwaysStoppedAnimation<double>(
                    1 - (widget.anIconAnimationController!.value) * 0.2),
                child: RotationTransition(
                  turns: AlwaysStoppedAnimation<double>(
                      Tween<double>(begin: 0, end: 24)
                              .animate(CurvedAnimation(
                                  parent: widget.anIconAnimationController!,
                                  curve: Curves.fastOutSlowIn))
                              .value /
                          360),
                  child: AvatarGlow(
                    endRadius: 55,
                    repeat: true,
                    showTwoGlows: true,
                    glowColor: kSecondaryColor,
                    child: InkWell(
                      child: const CircleAvatar(
                        radius: 42,
                        child: Icon(
                          Icons.person_pin,
                          size: 50,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const ProfilePage(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 12, bottom: 6),
            child: Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          Text(
            email,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
