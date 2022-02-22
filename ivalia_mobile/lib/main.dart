import 'package:flutter/material.dart';
import 'package:ivalia_mobile/ui/styles/colors.dart';
import 'package:ivalia_mobile/ui/widgets/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: ColorStyles.darkerBlue,
          scaffoldBackgroundColor: ColorStyles.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const SplashScreen()
    );
  }
}
