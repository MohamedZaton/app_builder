import 'package:app_builder/helper/hex_color.dart';
import 'package:app_builder/provider_states/Feed_state.dart';
import 'package:app_builder/provider_states/app_state.dart';
import 'package:app_builder/provider_states/connect_state.dart';
import 'package:app_builder/utils/connect_status_enum.dart';
import 'package:app_builder/utils/loading_enum.dart';
import 'package:app_builder/widgets/connect_error.dart';
import 'package:app_builder/widgets/post_card.dart';
import 'package:app_builder/widgets/side_menu/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "/Home_screen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppState>(context, listen: false);
    return Consumer<ConnectState>(
      builder: (context, connectState, child) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text("Home"),
            ),
            drawer: DrawerMenu(appState: appState),
            body: connectState.networkState != ConnectEnStatus.Offline
                ? Consumer<FeedState>(
                    builder: (context, feedState, child) {
                      return feedState.viewState == LoadingState.Done
                          ? feedState.posts.isNotEmpty
                              ? ListView.builder(
                                  itemCount: feedState.posts.length,
                                  itemBuilder: (context, index) =>
                                      PostCard(post: feedState.posts[index]),
                                )
                              : Center(
                                  child: Text(" choose item from side menu"),
                                )
                          : Center(
                              child: CircularProgressIndicator(),
                            );
                    },
                  )
                : ConnectionError(),
          ),
        );
      },
    );
  }
}
