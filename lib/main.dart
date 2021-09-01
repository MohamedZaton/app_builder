import 'package:app_builder/helper/hex_color.dart';
import 'package:app_builder/models/config_model.dart';
import 'package:app_builder/provider_states/app_state.dart';
import 'package:app_builder/screens/home_screen.dart';
import 'package:app_builder/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
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
      ],
      child: Consumer<AppState>(
        builder: (context, appState, child) {
          return StreamBuilder<ConfigModel?>(
              stream: appState.loadingConfigApp(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return MaterialApp(
                      title: 'APP Builder',
                      home: SplashScreen(),
                      theme: buildTheme(snapshot.data, context),
                      initialRoute: SplashScreen.id,
                      debugShowCheckedModeBanner: false,
                      routes: {
                        SplashScreen.id: (context) => SplashScreen(),
                        HomeScreen.id: (context) => HomeScreen(),
                      });
                } else {
                  return Scaffold(
                    body: Container(
                        child: Center(child: CircularProgressIndicator())),
                  );
                }
              });
        },
      ),
    );
  }

  ThemeData buildTheme(ConfigModel? configModel, BuildContext context) {
    return ThemeData.light().copyWith(
      scaffoldBackgroundColor:
          HexColor(configModel!.appColor!.pageBg.toString()),
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: HexColor(configModel.appColor!.textColor.toString()),
            displayColor: HexColor(configModel.appColor!.textColor.toString()),
          ),
    );
  }
}
