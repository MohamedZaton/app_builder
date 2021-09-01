import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static String id = "/splash_screen";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("splash_screen"),
      ),
    );
  }
}
