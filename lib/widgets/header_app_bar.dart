import 'package:app_builder/helper/hex_color.dart';
import 'package:app_builder/models/config_model.dart';
import 'package:flutter/material.dart';

class HeaderAppBar extends StatefulWidget {
  final ConfigModel configModel;
  const HeaderAppBar({Key? key, required this.configModel}) : super(key: key);

  @override
  _HeaderAppBarState createState() => _HeaderAppBarState();
}

class _HeaderAppBarState extends State<HeaderAppBar> {
  @override
  Widget build(BuildContext context) {
    ConfigModel configModel = widget.configModel;

    return AppBar(
      title: Text("Home"),
    );
  }
}
