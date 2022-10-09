import 'package:coffie_shop/component/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TitleWithDivider extends StatelessWidget {
  final String title;
  const TitleWithDivider({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _title();
  }

  Widget _title() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 20,
          width: 3,
          margin: const EdgeInsets.symmetric(vertical: 4),
          color: Colors.deepOrange,
        ),
        const SizedBox(width: 15),
        Flexible(
          child: CustomText(
            text: title,
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 25,
          ),
        )
      ],
    );
  }
}
