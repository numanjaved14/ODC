import 'package:flutter/material.dart';
import 'package:real_estate/services/lang_pref.dart';

import '../drawer/home_navigation.dart';

class QrCode extends StatefulWidget {
  @override
  State<QrCode> createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  bool _isFrench = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLnguage();
  }

  void getLnguage() async {
    String language = await LangPref.getLang();
    print("Output of Pref " + language);
    if (language == 'fr') {
      setState(() {
        _isFrench = true;
      });
    } else {
      setState(() {
        _isFrench = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 30,
        elevation: 0,
      ),
      body: WillPopScope(
        onWillPop: _onWillPop,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _isFrench ? 'Scannez le code QR' : 'Scan QR code',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                'assets/images/qrscan.jpeg',
                // fit: BoxFit.fitWidth,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to exit this page?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  NavigationHomePage.routeName,
                  (route) => false,
                ),
                child: const Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }
}
