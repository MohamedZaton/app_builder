import 'package:app_builder/models/parameters_model.dart';

class MenuItems {
  String? component;
  Parameters? parameters;
  String? title;

  MenuItems({this.component, this.parameters, this.title});

  MenuItems.fromJson(Map<String, dynamic> json) {
    component = json['component'];
    parameters = (json['parameters'] != null
        ? new Parameters.fromJson(json['parameters'])
        : null)!;
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['component'] = this.component;
    if (this.parameters != null) {
      data['parameters'] = this.parameters!.toJson();
    }
    data['title'] = this.title;
    return data;
  }
}
