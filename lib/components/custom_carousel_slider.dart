import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarouselSlider extends StatelessWidget {
  final String image;
  const CustomCarouselSlider({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CarouselSlider(
          items: [
            Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ],
          options: CarouselOptions(
            height: (MediaQuery.of(context).size.width / 1.2) - 24,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal,
            pauseAutoPlayOnTouch: true,
            pageSnapping: true,
          ),
        ),
      ],
    );
  }
}
