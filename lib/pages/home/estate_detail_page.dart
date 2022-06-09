import 'package:flutter/material.dart';

import '/components/amenities_widget.dart';
import '/models/estate_list_data.dart';
import '/utils/constants.dart';
import '/components/manager_widget.dart';
import '/components/custom_carousel_slider.dart';
import '/components/favorite_button.dart';
import '/components/arrow_back_widget.dart';
import 'widgets/description_widget.dart';
import 'widgets/estate_details_footer.dart';
import 'widgets/price_rating_wiget.dart';

class EstateDetailsPage extends StatefulWidget {
  final EstateListData? estateData;
  const EstateDetailsPage({
    Key? key,
    required this.estateData,
  }) : super(key: key);
  @override
  _EstateDetailsPageState createState() => _EstateDetailsPageState();
}

class _EstateDetailsPageState extends State<EstateDetailsPage>
    with TickerProviderStateMixin {
  final double infoHeight = 364;

  Animation<double>? animation;
  AnimationController? animationController;
  double opacity1 = 0;
  double opacity2 = 0;
  double opacity3 = 0;
  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: animationController!,
        curve: const Interval(0, 1, curve: Curves.fastOutSlowIn)));
    setData();
    super.initState();
  }

  Future<void> setData() async {
    animationController?.forward();
    await Future<dynamic>.delayed(const Duration(milliseconds: 202));
    setState(() {
      opacity1 = 1;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 204));
    setState(() {
      opacity2 = 1;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 206));
    setState(() {
      opacity3 = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double tempHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).size.width / 1.2) +
        24;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1.2,
                child: Hero(
                  tag: 'homeestate${widget.estateData!.imageUrl}',
                  child: CustomCarouselSlider(
                    image: widget.estateData!.imageUrl,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: (MediaQuery.of(context).size.width / 1.2) - 24,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(34),
                    topRight: Radius.circular(34)),
                boxShadow: kBoxShadow,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  constraints: BoxConstraints(
                      minHeight: infoHeight,
                      maxHeight:
                          tempHeight > infoHeight ? tempHeight : infoHeight),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 32, left: 18, right: 16),
                          child: Text(
                            widget.estateData!.titleTxt,
                            style: kSubTitle2Style,
                          ),
                        ),
                        PriceRatingWidget(
                          estateData: widget.estateData,
                        ),
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 500),
                          opacity: opacity1,
                          child: const AmenitiesWidget(),
                        ),
                        DescriptionWidget(
                          opacity2: opacity2,
                          estateData: widget.estateData,
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Center(
                          child: Container(
                            width: size.width * 0.88,
                            height: size.height * 0.2,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              // boxShadow: kBoxShadow,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: const Image(
                                image: AssetImage(
                                  'assets/images/map.jpg',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        ManagerWidget(
                            managerName: widget.estateData!.lordLandName,
                            managerImage: widget.estateData!.lordLandImage),
                        EstateDetailsFooter(
                          estateData: widget.estateData!,
                          opacity3: opacity3,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).padding.bottom,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          FavoriteButton(
            animationController: animationController,
            propertyId: widget.estateData!.id,
          ),
          const ArrowBackWidget(),
        ],
      ),
    );
  }
}
