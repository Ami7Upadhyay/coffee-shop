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

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  double width = 0;
  double height = 0;
  double imageHeight = 100;
  double imageWidth = 100;
  late AnimationController animationController;
  Animation<Offset>? animationOffset;
  Animation<Offset>? animationOffset1;
  Animation<double>? exploreAnimation;
  Animation<Offset>? textAnimationOffset;
  Animation<Offset>? textAnimationOffset1;
  Animation<Offset>? textAnimationOffset2;
  late AnimationController animationController2;
  Animation<Offset>? exploreWidgetAnimation;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));

    animationController.forward();
    animationOffset =
        Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0))
            .animate(CurvedAnimation(
                parent: animationController, curve: const Interval(0, 0.16)));
    animationOffset1 =
        Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0))
            .animate(CurvedAnimation(
                parent: animationController,
                curve: const Interval(0.16, 0.32)));
    exploreAnimation = Tween<double>(begin: 0, end: imageHeight).animate(
        CurvedAnimation(
            parent: animationController,
            curve: const Interval(0.32, 0.48, curve: Curves.ease)));
    textAnimationOffset =
        Tween<Offset>(begin: const Offset(-5, 0), end: const Offset(0, 0))
            .animate(CurvedAnimation(
                parent: animationController,
                curve: const Interval(0.48, 0.64, curve: Curves.decelerate)));
    textAnimationOffset1 = Tween<Offset>(
            begin: const Offset(-5, 0), end: const Offset(0, 0))
        .animate(CurvedAnimation(
            parent: animationController,
            curve: const Interval(0.64, 0.8, curve: Curves.linearToEaseOut)));
    textAnimationOffset2 = Tween<Offset>(
            begin: const Offset(-5, 0), end: const Offset(0, 0))
        .animate(CurvedAnimation(
            parent: animationController,
            curve:
                const Interval(0.8, 1, curve: Curves.fastLinearToSlowEaseIn)));

    animationController.addListener(() {
      setState(() {});
    });

    animationController2 =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    exploreWidgetAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(0, -0.2))
            .animate(animationController2);
    animationController2.forward();
    animationController2.addStatusListener((status) {
      if (AnimationStatus.completed == status) {
        animationController2.reverse();
      } else if (AnimationStatus.dismissed == status) {
        animationController2.forward();
      }
    });

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
              Expanded(
                  child: SlideTransition(
                      position: animationOffset!,
                      child: detailsAndDescription())),
              Expanded(
                  child: SlideTransition(
                      position: animationOffset1!, child: image())),
            ],
          ),
        ),
        Positioned(
          top: (height / 2) - exploreAnimation!.value / 2,
          left: (width / 2) - exploreAnimation!.value / 2,
          child: SlideTransition(
            position: exploreWidgetAnimation!,
            child: CustomAssetImage(
              imageName: 'scroll',
              boxFit: BoxFit.contain,
              height: exploreAnimation!.value,
              width: exploreAnimation!.value,
            ),
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
          SlideTransition(
            position: textAnimationOffset!,
            child: const CustomText(
              text: 'Choose Your Favourite Coffee And Enjoy.',
              fontSize: 40,
            ),
          ),
          const SizedBox(height: 40),
          SlideTransition(
            position: textAnimationOffset1!,
            child: const CustomText(
              text: 'Buy the best and delicious coffee',
              color: Colors.white60,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 40),
          SlideTransition(
              position: textAnimationOffset2!,
              child: const Divider(color: Colors.grey)),
          const SizedBox(height: 40),
          SlideTransition(position: textAnimationOffset2!, child: details())
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
