import 'package:flutter/material.dart';
import 'package:google_search/colors.dart';

class SearchFooter extends StatelessWidget {
  const SearchFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          color: footerColor,
          padding: EdgeInsets.symmetric(
              horizontal: size.width < 768 ? 15 : 110, vertical: 15),
          child: Row(
            children: <Widget>[
              Text(
                "India",
                style: TextStyle(color: Colors.grey[700], fontSize: 15),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 20,
                width: 0.5,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.circle,
                color: Color(0xff70757A),
                size: 12,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Silvassa, Dadra and Nagar Haveli and Daman and Diu",
                style: TextStyle(
                    fontSize: size.width < 768 ? 10 : 14, color: primaryColor),
              ),
            ],
          ),
        ),
        const Divider(
          height: 0,
        ),
        Container(
          color: footerColor,
          padding: EdgeInsets.symmetric(
              horizontal: size.width < 768 ? 15 : 110, vertical: 15),
          child: Row(
            children: <Widget>[
              Text(
                "Help",
                style: TextStyle(color: Colors.grey[700], fontSize: 15),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                "Send Feedback",
                style: TextStyle(color: Colors.grey[700], fontSize: 15),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                "Privacy",
                style: TextStyle(color: Colors.grey[700], fontSize: 15),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                "Terms",
                style: TextStyle(color: Colors.grey[700], fontSize: 15),
              ),
              SizedBox(
                width: 30,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
