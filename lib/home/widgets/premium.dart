import 'package:coffie_shop/component/asset_image.dart';
import 'package:coffie_shop/component/responsive.dart';
import 'package:coffie_shop/component/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../component/titel_with_vertical_divider.dart';
import 'default_padding_container.dart';

class Premium extends StatefulWidget {
  const Premium({Key? key}) : super(key: key);

  @override
  State<Premium> createState() => _PremiumState();
}

class _PremiumState extends State<Premium> {
  var descriptionText = '''
We are delighted with our coffee. That's why you get the bset
premium coffee plus the kettle made of resistant materials tha
you see in the image, for special price 
''';

  List<String> logoList = [
    "logocoffee1",
    "logocoffee2",
    "logocoffee3",
    "logocoffee4",
    "logocoffee5"
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultPaddingContainer(
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title(),
        _buySection(),
        _divider(),
        _logos(),
      ],
    );
  }

  Widget _title() {
    return const TitleWithDivider(title: '''
We offer a premium and better quality
prepration just for you!
 ''');
  }

  Widget _divider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Divider(
        height: 1,
        color: Colors.grey.shade500,
      ),
    );
  }

  Widget _buySection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 40, 0, 20),
      child: Flex(
        direction:
            Responsive.isMobile(context) ? Axis.vertical : Axis.horizontal,
        children: [
          image(),
          Responsive.isMobile(context)
              ? _buyPremiumCoffee()
              : Flexible(child: _buyPremiumCoffee()),
        ],
      ),
    );
  }

  Widget image() {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Padding(
          padding:
              EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.04),
          child: const CustomAssetImage(
            imageName: 'quality1',
            boxFit: BoxFit.cover,
            height: 250,
            width: 300,
            radius: 15,
          ),
        ),
        const CustomAssetImage(
          imageName: 'quality2',
          height: 125,
          width: 125,
          boxFit: BoxFit.cover,
          radius: 10,
        ),
      ],
    );
  }

  Widget _buyPremiumCoffee() {
    return Padding(
      padding: Responsive.isMobile(context)
          ? const EdgeInsets.only(top: 40)
          : const EdgeInsets.fromLTRB(45, 0, 0, 0),
      child: Flex(
        direction: Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: "Premium Coffee",
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: 20),
          const CustomText(
            text: "\$94.99",
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
          CustomText(
            text: "Especial Price",
            color: Colors.grey.shade500,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: 10),
          CustomText(
            text: descriptionText,
            color: Colors.grey.shade500,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: 10),
          FittedBox(child: _buyNowAndSeeMoreBtn())
        ],
      ),
    );
  }

  Widget _buyNowAndSeeMoreBtn() {
    return Row(
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.black,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 18)),
            onPressed: () {},
            child: CustomText(
              text: 'Buy Now'.toUpperCase(),
            )),
        const SizedBox(width: 20),
        Row(
          children: [
            CustomText(
              text: "See More".toUpperCase(),
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(width: 10),
            const Icon(
              Icons.arrow_forward_rounded,
              size: 20,
              color: Colors.black87,
            )
          ],
        )
      ],
    );
  }

  Widget _logos() {
    return Container(
      width: double.infinity,
      child: Wrap(
        alignment: Responsive.isMobile(context)
            ? WrapAlignment.center
            : WrapAlignment.spaceBetween,
        direction: Axis.horizontal,
        children: List.generate(
            logoList.length,
            (index) => Container(
                  padding: Responsive.isMobile(context)
                      ? const EdgeInsets.only(right: 20)
                      : EdgeInsets.zero,
                  child: CustomAssetImage(
                    imageName: logoList[index],
                    height: 100,
                    width: 100,
                  ),
                )),
      ),
    );
  }
}
