class ColorModel {
  String? pageBg;
  String? headerBg;
  String? headerText;
  String? menuBg;
  String? menuItemBGColor;
  String? menuItemSelectedBgColor;
  String? listTitle;
  String? listItemBg;
  String? textColor;

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
    pageBg = json['pageBg'] ?? "#F0F0F0";
    headerBg = json['headerBg'] ?? "#2e2e2e";
    headerText = json['headerText'] ?? "#ffffff";
    menuBg = json['menuBg'] ?? "#2e2e2e";
    menuItemBGColor = json['menuItemBGColor'] ?? "#ffffff";
    menuItemSelectedBgColor = json['menuItemSelectedBgColor'] ?? "#ffefe6";
    listTitle = json['listTitle'] ?? "#2e2e2e";
    listItemBg = json['listItemBg'] ?? "#ffffff";
    textColor = json['textColor'] ?? "#2e2e2e";
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
