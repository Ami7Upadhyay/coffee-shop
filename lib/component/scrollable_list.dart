import 'package:coffie_shop/home/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../home/widgets/explore_widget.dart';
import '../home/widgets/home_widget.dart';
import '../home/widgets/premium.dart';
import '../home/widgets/product.dart';

class ScrollableList extends StatefulWidget {
  const ScrollableList({Key? key}) : super(key: key);

  @override
  State<ScrollableList> createState() => _ScrollableListState();
}

class _ScrollableListState extends State<ScrollableList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          HomeWidget(),
          Explore(),
          Product(),
          Premium(),
          Footer()
        ],
      ),
    );
  }
}
