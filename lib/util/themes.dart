import 'package:flutter/material.dart';

const Map<int, Color> primaryColor = {
  50: Color.fromRGBO(255, 82, 82, .1),
  100: Color.fromRGBO(255, 82, 82, .2),
  200: Color.fromRGBO(255, 82, 82, .3),
  300: Color.fromRGBO(255, 82, 82, .4),
  400: Color.fromRGBO(255, 82, 82, .5),
  500: Color.fromRGBO(255, 82, 82, .6),
  600: Color.fromRGBO(255, 82, 82, .7),
  700: Color.fromRGBO(255, 82, 82, .8),
  800: Color.fromRGBO(255, 82, 82, .9),
  900: Color.fromRGBO(255, 82, 82, 1),
};
MaterialColor primarySwatch = const MaterialColor(0xFFFF5252, primaryColor);

ThemeData customLightTheme() {
  final ThemeData lightTheme = ThemeData(primarySwatch: primarySwatch);
  return lightTheme.copyWith(
    splashColor: Colors.redAccent,
    platform: TargetPlatform.iOS,
    textTheme: lightTheme.textTheme.apply(
      bodyColor: Colors.black,
      displayColor: Colors.black,
    ),
    textSelectionTheme: lightTheme.textSelectionTheme.copyWith(
      cursorColor: Colors.black87,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
        TargetPlatform.linux: CupertinoPageTransitionsBuilder(),
      },
    ),
    drawerTheme: lightTheme.drawerTheme.copyWith(backgroundColor: Colors.white),
    cardTheme: lightTheme.cardTheme.copyWith(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: Colors.grey.shade100,
        surfaceTintColor: Colors.grey.shade300),
    indicatorColor: const Color(0xFF807A6B),
    scaffoldBackgroundColor: Colors.white,
    primaryIconTheme: lightTheme.primaryIconTheme.copyWith(
      color: const Color(0xFF807A6B),
      size: 24,
    ),
    iconTheme: lightTheme.iconTheme.copyWith(
      color: const Color(0xFF807A6B),
      size: 24,
    ),
    backgroundColor: Colors.white,
    tabBarTheme: lightTheme.tabBarTheme.copyWith(
      unselectedLabelColor: Colors.grey,
    ),
    scrollbarTheme: lightTheme.scrollbarTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(8),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(vertical: 16, horizontal: 8)),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        // backgroundColor: MaterialStateProperty.resolveWith<Color?>(
        //   (states) {
        //     if (states.contains(MaterialState.disabled)) {
        //       return Colors.grey;
        //     } else if (states.contains(MaterialState.pressed)) {
        //       return Colors.white.withOpacity(0.5);
        //     }
        //     return Colors.grey.withOpacity(0.3);
        //   },
        // ),
        foregroundColor: MaterialStateProperty.all<Color>(
          Colors.white,
        ), //text (and icon)
      ),
    ),
    buttonTheme: lightTheme.buttonTheme.copyWith(buttonColor: Colors.black),
    errorColor: Colors.redAccent,
    appBarTheme: lightTheme.appBarTheme.copyWith(
      toolbarHeight: kToolbarHeight + 1.25,
      foregroundColor: Colors.white,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.grey.shade800),
      titleTextStyle:
          lightTheme.appBarTheme.titleTextStyle?.copyWith(color: Colors.white),
    ),
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: const Color(0xFF807A6B),
      hintStyle: const TextStyle(color: Colors.grey),
      filled: true,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      fillColor: Colors.grey.withOpacity(0.3),
      focusedBorder: inputBorder().copyWith(
          borderSide: BorderSide(
        color: Colors.redAccent.withOpacity(0.1),
      )),
      enabledBorder: inputBorder(),
      border: inputBorder(),
    ),
    floatingActionButtonTheme: lightTheme.floatingActionButtonTheme.copyWith(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    ),
  );
}

ThemeData customDarkTheme() {
  final ThemeData darkTheme = ThemeData(primarySwatch: primarySwatch);
  return darkTheme.copyWith(
    splashColor: Colors.redAccent,
    platform: TargetPlatform.iOS,
    textTheme: darkTheme.textTheme.apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
    textSelectionTheme: darkTheme.textSelectionTheme.copyWith(
      cursorColor: Colors.white70,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
        TargetPlatform.linux: CupertinoPageTransitionsBuilder(),
      },
    ),
    drawerTheme: darkTheme.drawerTheme.copyWith(backgroundColor: Colors.white),
    cardTheme: darkTheme.cardTheme.copyWith(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: Colors.grey.shade800,
        surfaceTintColor: Colors.grey.shade800),
    indicatorColor: const Color(0xFF807A6B),
    scaffoldBackgroundColor: Colors.black,
    primaryIconTheme: darkTheme.primaryIconTheme.copyWith(
      color: const Color(0xFF807A6B),
      size: 20,
    ),
    iconTheme: darkTheme.iconTheme.copyWith(
      color: const Color(0xFF807A6B),
      size: 22,
    ),
    backgroundColor: Colors.black,
    tabBarTheme: darkTheme.tabBarTheme.copyWith(
      unselectedLabelColor: Colors.grey,
    ),
    scrollbarTheme: darkTheme.scrollbarTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(8),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(vertical: 16, horizontal: 8)),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        // backgroundColor: MaterialStateProperty.resolveWith<Color?>(
        //   (states) {
        //     if (states.contains(MaterialState.disabled)) {
        //       return Colors.grey;
        //     } else if (states.contains(MaterialState.pressed)) {
        //       return Colors.white.withOpacity(0.5);
        //     }
        //     return Colors.grey.withOpacity(0.3);
        //   },
        // ),
        foregroundColor: MaterialStateProperty.all<Color>(
          Colors.white,
        ), //text (and icon)
      ),
    ),
    buttonTheme: darkTheme.buttonTheme.copyWith(buttonColor: Colors.black),
    errorColor: Colors.redAccent,
    appBarTheme: darkTheme.appBarTheme.copyWith(
      toolbarHeight: kToolbarHeight + 1.25,
      foregroundColor: Colors.black,
      backgroundColor: Colors.black,
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle:
          darkTheme.appBarTheme.titleTextStyle?.copyWith(color: Colors.white),
    ),
    bottomAppBarColor: Colors.black,
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: const Color(0xFF807A6B),
      hintStyle: const TextStyle(color: Colors.grey),
      filled: true,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      fillColor: Colors.grey.withOpacity(0.3),
      focusedBorder: inputBorder().copyWith(
          borderSide: BorderSide(
        color: Colors.redAccent.withOpacity(0.3),
      )),
      enabledBorder: inputBorder(),
      border: inputBorder(),
    ),
    floatingActionButtonTheme: darkTheme.floatingActionButtonTheme.copyWith(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    ),
  );
}

BorderSide inputBorderSide = BorderSide(color: Colors.transparent);
BorderRadius inputBorderRadius = BorderRadius.circular(10);

OutlineInputBorder inputBorder() {
  return OutlineInputBorder(
      borderSide: inputBorderSide, borderRadius: inputBorderRadius);
}
