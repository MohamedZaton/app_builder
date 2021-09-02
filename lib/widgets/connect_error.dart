import 'package:app_builder/provider_states/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConnectionError extends StatelessWidget {
  const ConnectionError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppState appState = Provider.of<AppState>(context);
    return Center(
      child: Container(
        color: appState.configModel!.appColor!.pageBg,
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/disconnected.png",
              height: 200,
              width: 200,
            ),
            Text(
              "Connection error, please check your connection  try again",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: appState.configModel!.appColor!.textColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
