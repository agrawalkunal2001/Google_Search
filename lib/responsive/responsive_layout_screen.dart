import 'package:flutter/material.dart';

class ResponsiveLayoutScreen extends StatelessWidget {
  final mobileScreenLayout;
  final webScreenLayout;
  const ResponsiveLayoutScreen(
      {Key? key,
      required this.mobileScreenLayout,
      required this.webScreenLayout})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth <= 768) {
        return mobileScreenLayout;
      }
      return webScreenLayout;
    });
  }
}
