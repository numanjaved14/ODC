import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '/components/amenities_widget.dart';
import '/components/rounded_button.dart';
import '/models/estate_list_data.dart';
import 'payment_page.dart';
import 'widgets/check_in_time_widget.dart';
import 'widgets/check_out_list_item.dart';
import 'widgets/price_details_widget.dart';
import 'widgets/property_details_widget.dart';

class CeckOutPage extends StatelessWidget {
  final EstateListData estateData;
  const CeckOutPage({
    Key? key,
    required this.estateData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Check Out',
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
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CheckOutListItem(
                        estateData: estateData,
                      ),
                      const SizedBox(height: 20),
                      const Divider(height: 1),
                      const SizedBox(height: 20),
                      const PropertyDetails(),
                      const SizedBox(height: 10),
                      const Divider(height: 1),
                      const SizedBox(height: 10),
                      const AmenitiesWidget(),
                      const Divider(
                        height: 1,
                      ),
                      const SizedBox(height: 10),
                      const CheckInTimeWidget(),
                      const SizedBox(height: 10),
                      const Divider(
                        height: 1,
                      ),
                      const PriceDetailsWidget(),
                      const Expanded(
                        child: SizedBox(height: 20),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: RoundedButton(
                          text: 'Confirm',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const PaymentPage(),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
