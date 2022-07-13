import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_search/colors.dart';
import 'package:google_search/widgets/mobile/mobile_footer.dart';
import 'package:google_search/widgets/search.dart';
import 'package:google_search/widgets/translation_buttons.dart';
import 'package:google_search/widgets/web/search_buttons.dart';
import 'package:google_search/widgets/web/web_footer.dart';

class MobileScreenLayout extends StatelessWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.grey,
          ),
          onPressed: () {},
        ),
        title: SizedBox(
          width: size.width * 0.3,
          child: const DefaultTabController(
            length: 2,
            child: TabBar(
              labelColor: blueColor,
              unselectedLabelColor: Colors.grey,
              indicatorColor: blueColor,
              tabs: [
                Tab(
                  text: "ALL",
                ),
                Tab(
                  text: "IMAGES",
                ),
              ],
            ),
          ),
        ),
        actions: [
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
            padding:
                const EdgeInsets.symmetric(vertical: 10).copyWith(right: 10),
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
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              height: size.height * 0.01,
            ),
            Column(
              children: const <Widget>[
                Search(),
                SizedBox(
                  height: 20,
                ),
                TranslationButtons(),
              ],
            ),
            const MobileFooter(),
            // Expanded(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: <Widget>[
            //       Column(
            //         children: const <Widget>[
            //           Search(),
            //           SizedBox(
            //             height: 20,
            //           ),
            //           TranslationButtons(),
            //         ],
            //       ),
            //       const MobileFooter(),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
