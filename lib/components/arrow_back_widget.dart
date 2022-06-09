import 'package:flutter/material.dart';

class ArrowBackWidget extends StatelessWidget {
  const ArrowBackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: AppBar().preferredSize.height,
            height: AppBar().preferredSize.height,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black54,
              ),
            ),
          ),
          SizedBox(
            width: AppBar().preferredSize.height,
            height: AppBar().preferredSize.height,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius:
                    BorderRadius.circular(AppBar().preferredSize.height),
                child: const Icon(
                  Icons.share,
                  color: Colors.black54,
                ),
                onTap: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
