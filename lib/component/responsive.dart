import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Responsive extends StatelessWidget {
  final Widget? desktop;
  final Widget? tablet;
  final Widget mobile;
  const Responsive({Key? key, this.desktop, this.tablet, required this.mobile})
      : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 650;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1110;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width > 650 &&
      MediaQuery.of(context).size.width < 1100;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth >= 1100) {
        return desktop ?? Container();
      } else if (constraints.maxWidth >= 650) {
        return tablet ?? Container();
      } else {
        return mobile;
      }
    });
  }
}
