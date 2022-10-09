import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../component/responsive.dart';

class DefaultPaddingContainer extends StatelessWidget {
  Widget child;
  DefaultPaddingContainer({Key? key, required this.child}) : super(key: key);

  double width = 0;
  double height = 0;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Container(
        padding: Responsive.isDesktop(context)
            ? EdgeInsets.fromLTRB(width * 0.15, 0, width * 0.15, 50)
            : Responsive.isTablet(context)
                ? EdgeInsets.fromLTRB(width * 0.06, 50, width * 0.06, 50)
                : const EdgeInsets.all(30),
        child: child);
  }
}
