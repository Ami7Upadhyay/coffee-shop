import 'package:coffie_shop/component/asset_image.dart';
import 'package:coffie_shop/component/text_widget.dart';
import 'package:coffie_shop/home/widgets/default_padding_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WebBar extends StatelessWidget with PreferredSizeWidget {
  const WebBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(children: [_logo()]));
  }

  Widget _logo() {
    return Row(
      children: const [
        CustomAssetImage(
          imageName: 'logo',
          height: 20,
          width: 20,
        ),
        CustomText(
          text: "Coffee",
          fontSize: 15,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
