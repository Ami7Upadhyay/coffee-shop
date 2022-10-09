import 'package:coffie_shop/component/asset_image.dart';
import 'package:coffie_shop/component/responsive.dart';
import 'package:coffie_shop/component/text_widget.dart';
import 'package:coffie_shop/home/widgets/default_padding_container.dart';
import 'package:coffie_shop/home/widgets/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Footer extends StatefulWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  List<String> social = ['fb', "insta", "twitter"];
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.black, child: _buildContent());
  }

  Widget _buildContent() {
    return DefaultPaddingContainer(
      child: Padding(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.08),
        child: Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _heading(),
            const SizedBox(height: 20),
            _details(),
            _divider(),
            _socialAndCopyRight()
          ],
        ),
      ),
    );
  }

  Widget _heading() {
    return const CustomText(
      text: "Coffee.",
      fontSize: 20,
      fontWeight: FontWeight.w600,
    );
  }

  Widget _divider() {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.1),
      child: Divider(
        height: 1,
        color: Colors.grey.shade500,
      ),
    );
  }

  Widget _details() {
    return Flex(
      direction: Responsive.isMobile(context) ? Axis.vertical : Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Responsive.isMobile(context)
            ? _subscribeToOurNewsLetter()
            : Flexible(child: _subscribeToOurNewsLetter()),
        _titleAndDescription(
            title: "Address",
            subText: "9876 Hacienda Av.",
            endText: "Lima,La Libaertad, Peruu"),
        _titleAndDescription(
            title: "Contact",
            subText: "+987654321",
            endText: "coffee@gmail.com"),
        _titleAndDescription(
            title: "Office",
            subText: "Monday - Saturday",
            endText: "9AM - 10PM")
      ],
    );
  }

  Widget _subscribeToOurNewsLetter() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Subscirbe to our newsletter",
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.grey.shade400,
        ),
        Container(
          width: Responsive.isMobile(context)
              ? double.infinity
              : MediaQuery.of(context).size.width * 0.25,
          padding: const EdgeInsets.only(top: 5),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: TextFormField(
                    decoration: const InputDecoration(
                        filled: true,
                        isDense: true,
                        fillColor: Colors.white70,
                        hintText: "Your email address",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder()),
                  ),
                ),
                const SizedBox(width: 5),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(4)),
                  child: const Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _titleAndDescription(
      {required String title, required String subText, required endText}) {
    return Padding(
      padding: Responsive.isMobile(context)
          ? EdgeInsets.symmetric(vertical: 20)
          : EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: title,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: 15),
          CustomText(
            text: subText,
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade400,
          ),
          CustomText(
            text: endText,
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade400,
          )
        ],
      ),
    );
  }

  Widget _socialAndCopyRight() {
    return Container(
      width: double.infinity,
      child: Flex(
        direction:
            Responsive.isMobile(context) ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment: Responsive.isMobile(context)
            ? MainAxisAlignment.center
            : MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _social(),
          if (Responsive.isMobile(context))
            const SizedBox(
              height: 40,
            ),
          CustomText(
            text: "\u00a9 Bedimcode.All rights reseved",
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade400,
          )
        ],
      ),
    );
  }

  Widget _social() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
          social.length,
          (index) => SliderAnimation(
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: CustomAssetImage(
                    imageName: social[index],
                    height: 25,
                    width: 25,
                  ),
                ),
              )),
    );
  }
}
