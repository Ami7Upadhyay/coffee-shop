import 'package:coffie_shop/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:coffie_shop/extenstion/image_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pop(context);
      Navigator.of(context).push(_route());
    });
    super.initState();
  }

  Route _route() {
    return PageRouteBuilder(
        transitionDuration: const Duration(seconds: 4),
        transitionsBuilder: ((context, animation, secondaryAnimation, child) {
          // const begin = Offset(0.0, 1.0);
          // const end = Offset.zero;

          var curve = Curves.ease;
          var curveTween = CurveTween(curve: curve);

          final tween = Tween<double>(begin: 0, end: 1).chain(curveTween);
          final tweenAnimation = animation.drive(tween);
          return FadeTransition(
            opacity: tweenAnimation,
            child: child,
          );
        }),
        pageBuilder: (context, animation, secondaryAnimation) => const Home());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'loadcoffee'.toGif,
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width / 2,
        ),
      ),
    );
  }
}
