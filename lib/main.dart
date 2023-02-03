import 'package:flutter/material.dart';
import 'package:food_express/util/themes.dart';
import 'package:google_fonts/google_fonts.dart';

import 'util/router_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Food Express',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      darkTheme: customDarkTheme().copyWith(
          textTheme:
              GoogleFonts.comfortaaTextTheme(customDarkTheme().textTheme)),
      theme: customLightTheme().copyWith(

        textTheme: GoogleFonts.comfortaaTextTheme(customLightTheme().textTheme),
        brightness: Brightness.light,

      ),
    );
  }
}
