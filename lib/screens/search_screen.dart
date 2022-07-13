import 'package:flutter/material.dart';
import 'package:google_search/colors.dart';
import 'package:google_search/services/api_service.dart';
import 'package:google_search/widgets/search_footer.dart';
import 'package:google_search/widgets/search_header.dart';
import 'package:google_search/widgets/search_result_component.dart';
import 'package:google_search/widgets/search_tabs.dart';

class SearchScreen extends StatelessWidget {
  final String searchQuery;
  final String start;
  const SearchScreen({Key? key, required this.searchQuery, required this.start})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Title(
      color: Colors.blue,
      title: searchQuery,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: size.width < 768 ? 15 : 110),
                child: SearchHeader(
                  query: searchQuery,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width < 768 ? 15 : 110),
                child: SearchTabs(),
              ),
              const Divider(
                height: 0,
              ),
              FutureBuilder(
                future: ApiService()
                    .fetchData(queryTerm: searchQuery, start: start),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                              left: size.width < 768 ? 15 : 110, top: 12),
                          child: Text(
                            "About ${snapshot.data["searchInformation"]["formattedTotalResults"]} results (${snapshot.data["searchInformation"]["formattedSearchTime"]} seconds)",
                            style: const TextStyle(
                              fontSize: 15,
                              color: Color(0xff70757A),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.width < 768 ? 1 : 15,
                        ),
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data["items"].length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: size.width < 768 ? 15 : 110, top: 10),
                                child: SearchResultComponent(
                                  link: snapshot.data["items"][index]
                                      ["formattedUrl"],
                                  linkToGo: snapshot.data["items"][index]
                                      ["link"],
                                  text: snapshot.data["items"][index]["title"],
                                  desc: snapshot.data["items"][index]
                                      ["snippet"],
                                ),
                              );
                            }),
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              TextButton(
                                onPressed: () {
                                  if (start != "0") {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => SearchScreen(
                                          searchQuery: searchQuery,
                                          start: (int.parse(start) - 10)
                                              .toString(),
                                        ),
                                      ),
                                    );
                                  }
                                },
                                child: const Text(
                                  "< Prev",
                                  style:
                                      TextStyle(fontSize: 15, color: blueColor),
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => SearchScreen(
                                        searchQuery: searchQuery,
                                        start:
                                            (int.parse(start) + 10).toString(),
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Next >",
                                  style:
                                      TextStyle(fontSize: 15, color: blueColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SearchFooter()
                      ],
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
