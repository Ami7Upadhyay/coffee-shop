import 'package:coffie_shop/home/widgets/home_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:coffie_shop/extenstion/image_path.dart';

enum ImageType { toPng, toGif }

class CustomAssetImage extends StatelessWidget {
  final ImageType imageType;
  final String imageName;
  final BoxFit boxFit;
  final double? width;
  final double? height;
  final double? radius;
  const CustomAssetImage(
      {Key? key,
      this.imageType = ImageType.toPng,
      required this.imageName,
      this.boxFit = BoxFit.contain,
      this.width,
      this.height,
      this.radius = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius!),
      ),
      child: Image(
        image: AssetImage(imageName.toPng),
        fit: boxFit,
        width: width,
        height: height,
      ),
    );
  }
}
