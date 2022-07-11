import 'package:flutter/material.dart';
import 'package:google_search/colors.dart';
import 'package:google_search/widgets/footer_text.dart';

class WebFooter extends StatelessWidget {
  const WebFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: footerColor,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
                SizedBox(
                  width: 10,
                ),
                FooterText(title: "About"),
                SizedBox(
                  width: 10,
                ),
                FooterText(title: "Advertising"),
                SizedBox(
                  width: 10,
                ),
                FooterText(title: "Business"),
                SizedBox(
                  width: 10,
                ),
                FooterText(title: "How Search Works"),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
                FooterText(title: "Privacy"),
                SizedBox(
                  width: 10,
                ),
                FooterText(title: "Terms"),
                SizedBox(
                  width: 10,
                ),
                FooterText(title: "Settings"),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
