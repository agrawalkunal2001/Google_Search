import 'package:flutter/material.dart';
import 'package:google_search/colors.dart';

class SearchButtons extends StatelessWidget {
  const SearchButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            MaterialButton(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              color: searchColor,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
              child: Text("Google Search"),
              onPressed: () {},
            ),
            SizedBox(
              width: 10,
            ),
            MaterialButton(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              color: searchColor,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
              child: Text("I'm Feeling Lucky"),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
