import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '/components/rounded_button.dart';
import '/components/custom_text_form_field.dart';
import 'widgets/accommodation.dart';
import 'widgets/distance_view.dart';
import 'widgets/popular_filter.dart';
import 'widgets/price_slier.dart';

class FiltersPage extends StatefulWidget {
  const FiltersPage({
    Key? key,
  }) : super(key: key);
  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  double distValue = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Filter',
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Icon(
              FontAwesomeIcons.ellipsisV,
              color: Colors.white,
              size: 17,
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const <Widget>[
                  CustomTextFormField(
                    hintText: 'Where ?',
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Divider(
                    height: 1,
                  ),
                  PriceSlider(),
                  Divider(
                    height: 1,
                  ),
                  PopularFilter(),
                  Divider(
                    height: 1,
                  ),
                  DistanceView(),
                  Divider(
                    height: 1,
                  ),
                  Accommodation(),
                ],
              ),
            ),
          ),
          const Divider(
            height: 1,
          ),
          RoundedButton(
            text: 'Check Now',
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
