import 'package:app_builder/models/post_model.dart';
import 'package:app_builder/provider_states/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostCard extends StatelessWidget {
  final PostModel? post;

  const PostCard({@required this.post, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppState appState = Provider.of<AppState>(context);
    return Card(
      color: appState.configModel!.appColor!.listItemBg,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post?.title ?? "",
              style: TextStyle(
                color: appState.configModel!.appColor!.listTitle,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              post?.body ?? "",
              style: TextStyle(
                color: appState.configModel!.appColor!.textColor,
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
