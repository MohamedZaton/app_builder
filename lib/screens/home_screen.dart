import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "/Home_screen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Home_screen"),
      ),
    );
  }
}