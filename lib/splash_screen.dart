import 'package:flutter/material.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'core/routes/routes.dart';
import 'core/utils/app_styles.dart';
import 'generated/assets.dart';
import 'main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    gotoScreen();
    changeTextStyle();
    super.initState();
  }

  bool isChange = false;

  void changeTextStyle() {
    Future.delayed(const Duration(milliseconds: 700), () {
      setState(() {
        isChange = true;
      });
    });
  }

  void gotoScreen() {
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      if (isLoggedIn) {
        context.pushNamedAndRemoveUntil(Routes.home, (route) => false);
      } else {
        context.pushNamedAndRemoveUntil(Routes.login, (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: double.infinity),
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: Image.asset(
              Assets.imagesLogoRider,
              width: 200,
              height: 200,
              fit: BoxFit.fill,
            ),
          ),
          20.height,
          AnimatedSlide(
            curve: Curves.easeInOut,
            offset: isChange ? const Offset(0, -2) : const Offset(0, 0),
            duration: const Duration(milliseconds: 700),
            child: Text(
              'عبور  كوم',
              style: AppTextStyles.bold14MainColor.copyWith(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}
