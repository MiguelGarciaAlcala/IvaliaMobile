import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ivalia_mobile/ui/widgets/common/padded.dart';
import 'package:ivalia_mobile/ui/widgets/pages/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PaddedWidget.only(
        bottom: 20,
        child: Column(
          children: const [
            Spacer(),
            Center(
              child: FractionallySizedBox(
                  widthFactor: .6,
                  child: Image(image: AssetImage('assets/images/IV3.JPG'))
              ),
            ),
            Spacer(),
            CircularProgressIndicator()
          ],
        ),
      )
    );
  }
}

