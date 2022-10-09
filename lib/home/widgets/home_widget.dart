import 'package:coffie_shop/component/asset_image.dart';
import 'package:coffie_shop/component/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../component/text_widget.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  double width = 0;
  double height = 0;
  double imageHeight = 100;
  double imageWidth = 100;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        IntrinsicHeight(
          child: Flex(
            direction:
                Responsive.isMobile(context) ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: detailsAndDescription()),
              Expanded(child: image()),
            ],
          ),
        ),
        Positioned(
          top: (height / 2) - imageHeight / 2,
          left: (width / 2) - imageWidth / 2,
          child: CustomAssetImage(
            imageName: 'scroll',
            boxFit: BoxFit.contain,
            height: imageHeight,
            width: imageWidth,
          ),
        )
      ],
    );
  }

  Widget detailsAndDescription() {
    return Container(
      color: Colors.black,
      padding: Responsive.isDesktop(context)
          ? EdgeInsets.fromLTRB(width * 0.15, 100, 100, 20)
          : Responsive.isTablet(context)
              ? EdgeInsets.fromLTRB(width * 0.06, 100, 100, 20)
              : const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: 'Choose Your Favourite Coffee And Enjoy.',
            fontSize: 40,
          ),
          const SizedBox(height: 40),
          const CustomText(
            text: 'Buy the best and delicious coffee',
            color: Colors.white60,
            fontSize: 15,
          ),
          const SizedBox(height: 40),
          const Divider(color: Colors.grey),
          const SizedBox(height: 40),
          details()
        ],
      ),
    );
  }

  Widget details() {
    return Row(
      children: [
        Flexible(
          child: detail('120K', 'Testimonial',
              'Testimonial from \nvarious customers who \ntrust us'),
        ),
        Responsive.isMobile(context)
            ? const Spacer()
            : const SizedBox(width: 40),
        Flexible(
          child: detail('340+', 'Exclusive Product',
              'Premium \npreparation with \nquality ingredients.'),
        ),
      ],
    );
  }

  Widget detail(String titleText, String subTitle, String details) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: titleText,
          color: const Color.fromARGB(255, 255, 102, 0),
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        const SizedBox(height: 20),
        CustomText(
          text: subTitle,
          fontSize: 15,
        ),
        const SizedBox(height: 20),
        CustomText(
          text: details,
          color: Colors.white54,
          fontSize: 10,
        )
      ],
    );
  }

  Widget image() {
    return const CustomAssetImage(
      imageName: 'quality1',
      boxFit: BoxFit.fitHeight,
    );
  }
}
