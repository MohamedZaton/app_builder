import 'package:app_builder/provider_states/app_state.dart';
import 'package:flutter/material.dart';

import 'menu_list.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({
    Key? key,
    required this.appState,
  }) : super(key: key);

  final AppState appState;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MenuList(
        appState: appState,
      ),
    );
  }
}
