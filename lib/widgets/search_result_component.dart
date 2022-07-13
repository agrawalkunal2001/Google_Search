import 'package:flutter/material.dart';
import 'package:google_search/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchResultComponent extends StatefulWidget {
  final String link;
  final String text;
  final String linkToGo;
  final String desc;
  const SearchResultComponent(
      {Key? key,
      required this.link,
      required this.text,
      required this.linkToGo,
      required this.desc})
      : super(key: key);

  @override
  State<SearchResultComponent> createState() => _SearchResultComponentState();
}

class _SearchResultComponentState extends State<SearchResultComponent> {
  @override
  Widget build(BuildContext context) {
    bool showUnderline = false;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(widget.link),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () async {
              if (await canLaunchUrl(Uri.parse(widget.linkToGo))) {
                await launchUrl(Uri.parse(widget.linkToGo));
              }
            },
            onHover: (hovering) {
              setState(() {
                showUnderline = hovering;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.text,
                  style: TextStyle(
                      fontSize: 20,
                      color: blueColor,
                      decoration: showUnderline
                          ? TextDecoration.underline
                          : TextDecoration.none),
                ),
              ],
            ),
          ),
        ),
        Text(
          widget.desc,
          style: const TextStyle(fontSize: 14, color: primaryColor),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
