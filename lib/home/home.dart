import 'package:coffie_shop/component/app_bar.dart';
import 'package:coffie_shop/component/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../component/scrollable_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Responsive(
        mobile: ScrollableList(),
        desktop: ScrollableList(),
        tablet: ScrollableList(),
      ),
    );
  }
}
