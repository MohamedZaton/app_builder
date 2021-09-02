import 'color_model.dart';
import 'main_cg_model.dart';
import 'menu_items_model.dart';

class ConfigModel {
  MainCgModel? mainConfig;
  ColorModel? appColor;
  late List<MenuItemsModel> menuItems;

  ConfigModel({this.mainConfig, this.appColor, required this.menuItems});

  ConfigModel.fromJson(Map<String, dynamic> json) {
    mainConfig = MainCgModel.fromJson(json['mainConfig']);
    appColor = ColorModel.fromJson(json['appColor']);
    menuItems = List<MenuItemsModel>.from(
        json['menuItems'].map((data) => MenuItemsModel.fromJson(data)));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mainConfig != null) {
      data['mainConfig'] = this.mainConfig!.toJson();
    }
    if (this.appColor != null) {
      data['appColor'] = this.appColor!.toJson();
    }
    if (this.menuItems != null) {
      data['menuItems'] = this.menuItems.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
