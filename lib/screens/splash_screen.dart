import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:en_bd_translator_app/screens/traslator_screen.dart';
import 'package:en_bd_translator_app/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SpalshScreen extends StatelessWidget {
  const SpalshScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: colorsUsed.primaryColor,
      child: AnimatedSplashScreen(
        duration: 3000,
        splash: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Container(
                height: 150,
                width: 150,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/appstore.png",
                      ),
                      fit: BoxFit.contain),
                  //shape: BoxShape.circle
                )),
            const Spacer(),
          ],
        ),
        nextScreen: const TraslatorScreen(),
        splashIconSize: double.infinity,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.rightToLeft,
        animationDuration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
