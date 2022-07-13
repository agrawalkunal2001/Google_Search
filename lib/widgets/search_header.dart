import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_search/colors.dart';
import 'package:google_search/screens/search_screen.dart';

class SearchHeader extends StatelessWidget {
  final String? query;
  const SearchHeader({Key? key, required this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: size.width < 768 ? 35 : 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 15, top: 4),
                child: Image.asset(
                  "assets/google-logo.png",
                  height: 30,
                  width: 92,
                ),
              ),
              SizedBox(
                width: size.width < 768 ? 1 : 27,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                width: size.width < 768 ? size.width * 0.65 : size.width * 0.45,
                height: 44,
                decoration: BoxDecoration(
                  color: searchColor,
                  border: Border.all(color: searchColor),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: TextFormField(
                  onFieldSubmitted: (query) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            SearchScreen(searchQuery: query, start: "0"),
                      ),
                    );
                  },
                  initialValue: query,
                  style: const TextStyle(fontSize: 16),
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    suffixIcon: Container(
                      constraints: const BoxConstraints(maxWidth: 150),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SvgPicture.asset(
                            "assets/mic-icon.svg",
                            height: 20,
                            width: 20,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SvgPicture.asset(
                            "assets/search-icon.svg",
                            color: blueColor,
                          ),
                        ],
                      ),
                    ),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
          if (size.width >= 768)
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.settings),
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    "assets/more-apps.svg",
                    color: primaryColor,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10)
                      .copyWith(right: 10),
                  child: MaterialButton(
                    onPressed: () {},
                    color: const Color(0xff1A73EB),
                    child: const Text(
                      "Sign In",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
