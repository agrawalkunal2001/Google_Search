import 'package:flutter/material.dart';
import 'package:google_search/widgets/search_tab.dart';

class SearchTabs extends StatelessWidget {
  const SearchTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.width < 768 ? 40 : 55,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              SearchTab(icon: Icons.search, isActive: true, text: "All"),
              SizedBox(
                width: 20,
              ),
              SearchTab(icon: Icons.shop, text: "Shopping"),
              SizedBox(
                width: 20,
              ),
              SearchTab(icon: Icons.article, text: "News"),
              SizedBox(
                width: 20,
              ),
              SearchTab(icon: Icons.video_camera_back, text: "Videos"),
              SizedBox(
                width: 20,
              ),
              SearchTab(icon: Icons.image, text: "Images"),
              SizedBox(
                width: 20,
              ),
              SearchTab(icon: Icons.more_vert, text: "More"),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
