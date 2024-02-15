import 'package:flutter/material.dart';

class responvielayout extends StatelessWidget {
  const responvielayout(
      {super.key, required this.moblielayout, required this.weblayout});
  final Widget weblayout;
  final Widget moblielayout;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return weblayout;
        } else {
          return moblielayout;
        }
      },
    );
  }
}
