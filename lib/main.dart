import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/constant.dart';
import 'splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'مرافق الحلقات',

      themeMode: ThemeMode.system,

      theme: ThemeData(
        fontFamily: 'Somar_Regular',
        colorScheme: ColorScheme.fromSeed(seedColor: praimaryColor),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: praimaryColor,
            foregroundColor: whiteColoe,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: BorderSide(width: 1, color: borderColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: BorderSide(width: 1, color: borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: BorderSide(color: praimaryColor, width: 2),
          ),
        ),
        useMaterial3: true,
      ),

      // darkTheme: ThemeData(
      //   fontFamily: 'Somar_Regular',
      //   colorScheme: ColorScheme.fromSeed(
      //       seedColor: goldenColor, brightness: Brightness.dark),
      //   elevatedButtonTheme: ElevatedButtonThemeData(
      //     style: ElevatedButton.styleFrom(
      //       backgroundColor: goldenColor,
      //       foregroundColor: whiteColoe,
      //       shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(12),
      //       ),
      //     ),
      //   ),
      //   inputDecorationTheme: InputDecorationTheme(
      //     border: OutlineInputBorder(
      //       borderRadius: BorderRadius.circular(11),
      //       borderSide: BorderSide(width: 1, color: borderColor),
      //     ),
      //     enabledBorder: OutlineInputBorder(
      //       borderRadius: BorderRadius.circular(11),
      //       borderSide: BorderSide(width: 1, color: borderColor),
      //     ),
      //     focusedBorder: OutlineInputBorder(
      //       borderRadius: BorderRadius.circular(11),
      //       borderSide: BorderSide(color: goldenColor, width: 2),
      //     ),
      //   ),
      // ),

      home: SplashScreen(),
    );
  }
}
