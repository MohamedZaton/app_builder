import 'package:app_builder/models/color_model.dart';
import 'package:app_builder/models/menu_items_model.dart';
import 'package:app_builder/provider_states/Feed_state.dart';
import 'package:app_builder/provider_states/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuList extends StatefulWidget {
  final AppState appState;
  const MenuList({Key? key, required this.appState}) : super(key: key);

  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  int _selectedItem = -1;
  @override
  Widget build(BuildContext context) {
    List<MenuItemsModel> menuItems = widget.appState.configModel!.menuItems;
    ColorModel? colorModel = widget.appState.configModel!.appColor;

    var feedState = Provider.of<FeedState>(context);

    return Container(
      color: colorModel!.listItemBg,
      width: 50.0,
      child: ListView.builder(
        itemCount: menuItems.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return Container(
            color: isSelected(index)
                ? colorModel.menuItemSelectedBgColor
                : colorModel.menuItemBGColor,
            child: ListTile(
              onTap: () async {
                feedState.setFeedType(menuItems[index].component.toString());
                feedState.userId = menuItems[index].parameters!.userId;
                feedState.webViewUrl = menuItems[index].parameters!.url;

                if (feedState.webViewUrl != null) {
                  if (await canLaunch(feedState.webViewUrl.toString())) {
                    await launch(feedState.webViewUrl.toString());
                  } else {
                    SnackBar(content: Text("App can't found web url "));
                  }
                } else {
                  feedState.getPosts();
                }
                Navigator.pop(context);
              },
              leading: SizedBox(
                child: Text(menuItems[index].title.toString(),
                    style: TextStyle(color: colorModel.listTitle)),
              ),
              title: Text(
                (menuItems[index].component == "posts")
                    ? menuItems[index].parameters!.apiName.toString()
                    : menuItems[index].parameters!.url.toString(),
              ),
            ),
          );
        },
      ),
    );
  }

  bool isSelected(int index) {
    return _selectedItem == index;
  }
}
