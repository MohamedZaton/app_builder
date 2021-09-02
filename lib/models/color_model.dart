import 'package:app_builder/helper/hex_color.dart';
import 'package:flutter/material.dart';

class ColorModel {
  Color? pageBg;
  Color? headerBg;
  Color? headerText;
  Color? menuBg;
  Color? menuItemBGColor;
  Color? menuItemSelectedBgColor;
  Color? listTitle;
  Color? listItemBg;
  Color? textColor;

  ColorModel(
      {this.pageBg,
      this.headerBg,
      this.headerText,
      this.menuBg,
      this.menuItemBGColor,
      this.menuItemSelectedBgColor,
      this.listTitle,
      this.listItemBg,
      this.textColor});

  ColorModel.fromJson(Map<String, dynamic> json) {
    pageBg = HexColor(json['pageBg'] ?? "#F0F0F0");
    headerBg = HexColor(json['headerBg'] ?? "#2e2e2e");
    headerText = HexColor(json['headerText']);
    menuBg = HexColor(json['menuBg'] ?? "#2e2e2e");
    menuItemBGColor = HexColor(json['menuItemBGColor'] ?? "#ffffff");
    menuItemSelectedBgColor =
        HexColor(json['menuItemSelectedBgColor'] ?? "#ffefe6");
    listTitle = HexColor(json['listTitle'] ?? "#2e2e2e");
    listItemBg = HexColor(json['listItemBg'] ?? "#ffffff");
    textColor = HexColor(json['textColor'] ?? "#2e2e2e");
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pageBg'] = this.pageBg;
    data['headerBg'] = this.headerBg;
    data['headerText'] = this.headerText;
    data['menuBg'] = this.menuBg;
    data['menuItemBGColor'] = this.menuItemBGColor;
    data['menuItemSelectedBgColor'] = this.menuItemSelectedBgColor;
    data['listTitle'] = this.listTitle;
    data['listItemBg'] = this.listItemBg;
    data['textColor'] = this.textColor;
    return data;
  }
}
