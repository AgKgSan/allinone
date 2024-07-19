import 'package:all_in_1/theme/themeviews/themeviews.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/provider.dart';



class ChangeTheme extends StatelessWidget {
  const ChangeTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context)=>UiProvider()..init(),
      child: Consumer<UiProvider>(
        builder: (context, UiProvider notifier, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Dark Theme',
            

            themeMode: notifier.isDark? ThemeMode.dark : ThemeMode.light,

            
            darkTheme: notifier.isDark? notifier.darkTheme : notifier.lightTheme,

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
            home: const ThemeViews(),
          );
        }
      ),
    );
  }
}