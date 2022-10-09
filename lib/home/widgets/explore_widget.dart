import 'package:coffie_shop/component/asset_image.dart';
import 'package:coffie_shop/component/responsive.dart';
import 'package:coffie_shop/component/text_widget.dart';
import 'package:coffie_shop/home/widgets/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../component/titel_with_vertical_divider.dart';
import 'default_padding_container.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return DefaultPaddingContainer(child: _buildContent());
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.only(top: 40),
      child: Flex(
        direction: Axis.vertical,
        mainAxisSize: MainAxisSize.min,
        children: [_titleAndSeeMoreBtn(), _buildSpacialtyList()],
      ),
    );
  }

  Widget _titleAndSeeMoreBtn() {
    return Flex(
      direction: Responsive.isMobile(context) ? Axis.vertical : Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: Responsive.isMobile(context)
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        Responsive.isMobile(context) ? _title() : Flexible(child: _title()),
        SizedBox(
          width: 40,
          height: Responsive.isMobile(context) ? 40 : 0,
        ),
        _seeMoreBtn()
      ],
    );
  }

  Widget _title() {
    return const TitleWithDivider(title: '''
Speciality coffee that makes you
happy and cheer you up!
''');
  }

  Widget _seeMoreBtn() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15)),
        onPressed: () {},
        child: CustomText(
          text: "See more".toUpperCase(),
          fontSize: 14,
        ));
  }

  Widget _buildSpacialtyList() {
    return _wrapBuilder();
  }

  Widget _wrapBuilder() {
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        alignment: Responsive.isMobile(context)
            ? WrapAlignment.center
            : Responsive.isTablet(context)
                ? WrapAlignment.center
                : WrapAlignment.start,
        runAlignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: List.generate(specialtyList.length, (int index) {
          Specialty specialty = specialtyList[index];
          return _specialtyContainer(specialty);
        }),
      ),
    );
  }

  Widget _specialtyContainer(Specialty specialty) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 40, 20, 40),
      child: Column(
        crossAxisAlignment: Responsive.isMobile(context)
            ? CrossAxisAlignment.center
            : Responsive.isDesktop(context)
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
        children: [
          SliderAnimation(
            child: CustomAssetImage(
              imageName: specialty.image,
              height: 70,
              width: 70,
            ),
          ),
          const SizedBox(height: 10),
          CustomText(
            text: specialty.title,
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: 10),
          CustomText(
            text: specialty.details,
            color: Colors.black54,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          )
        ],
      ),
    );
  }
}

class Specialty {
  final String image;
  final String title;
  final String details;

  Specialty({required this.image, required this.title, required this.details});
}

List<Specialty> specialtyList = [
  Specialty(
      image: "specialty1",
      title: "Selected Coffee",
      details: "We select the best premium coffee. for a true taste"),
  Specialty(
      image: "specialty2",
      title: "Delicious Cookies",
      details: "Enjoy your coffee wit some hot cookies"),
  Specialty(
      image: "specialty3",
      title: "Enjoy at Home",
      details: "Enjoy the best coffee int the comfrot of your home.")
];
