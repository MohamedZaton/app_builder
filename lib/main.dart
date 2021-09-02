import 'package:app_builder/helper/hex_color.dart';
import 'package:app_builder/models/config_model.dart';
import 'package:app_builder/provider_states/Feed_state.dart';
import 'package:app_builder/provider_states/app_state.dart';
import 'package:app_builder/provider_states/connect_state.dart';
import 'package:app_builder/screens/home_screen.dart';
import 'package:app_builder/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'helper/locator.dart';

void main() async {
  setupDependencies();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppState>(create: (_) => AppState()),
        ChangeNotifierProvider<FeedState>(create: (_) => FeedState()),
        ChangeNotifierProvider<ConnectState>(create: (_) => ConnectState()),
      ],
      child: Consumer<AppState>(
        builder: (context, appState, child) {
          if (appState.configModel != null) {
            return MaterialApp(
                title: 'APP Builder',
                home: SplashScreen(),
                theme: buildTheme(appState.configModel, context),
                initialRoute: SplashScreen.id,
                debugShowCheckedModeBanner: false,
                routes: {
                  SplashScreen.id: (context) => SplashScreen(),
                  HomeScreen.id: (context) => HomeScreen(),
                });
          } else {
            return Container(
              color: Colors.white,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }

  ThemeData buildTheme(ConfigModel? configModel, BuildContext context) {
    return ThemeData.light().copyWith(
      scaffoldBackgroundColor: configModel!.appColor!.pageBg,
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: configModel.appColor!.textColor,
            displayColor: configModel.appColor!.textColor,
          ),
      appBarTheme: AppBarTheme(
        color: configModel.appColor!.headerBg,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: configModel.appColor!.headerText,
              displayColor: configModel.appColor!.headerText,
            ),
      ),
    );
  }
}
