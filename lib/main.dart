import 'package:all_in_1/view/main_tabview/maintab_view.dart';
import 'package:all_in_1/view/onboarding/startup_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'theme/provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('access_token');

  runApp(MyApp(isLoggedIn: token != null));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => UiProvider()..init(),
      child:
          Consumer<UiProvider>(builder: (context, UiProvider notifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Dark Theme',

          themeMode: notifier.isDark ? ThemeMode.dark : ThemeMode.light,

          darkTheme: notifier.isDark ? notifier.darkTheme : notifier.lightTheme,

          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          // theme: notifier.isDark
          //   ? ThemeData(
          //       brightness: Brightness.dark,
          //     )
          //   : ThemeData(
          //       brightness: Brightness.light,

          //     ),
          home: isLoggedIn ? const MainTabView() : const StartupView(),
        );
      }),
    );
  }
}
