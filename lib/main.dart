import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/constant.dart';
import 'core/routes/app_pages.dart';
import 'core/routes/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'مرافق الحلقات',

      locale: Locale('ar'),

      themeMode: ThemeMode.system,

      theme: ThemeData(
        scaffoldBackgroundColor: whiteColor,
        fontFamily: 'Somar_Regular',
        colorScheme: ColorScheme.fromSeed(seedColor: praimaryColor),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: praimaryColor,
            foregroundColor: whiteColor,
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

       darkTheme: ThemeData(
         fontFamily: 'Somar_Regular',
         colorScheme: ColorScheme.fromSeed(
             seedColor: goldenColor, brightness: Brightness.dark),
         elevatedButtonTheme: ElevatedButtonThemeData(
           style: ElevatedButton.styleFrom(
             backgroundColor: goldenColor,
             foregroundColor: whiteColor,
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
            borderSide: BorderSide(color: goldenColor, width: 2),
          ),
        ),
      ),

      initialRoute: AppRoutes.splash,
      getPages: AppPages.routes,
    );
  }
}
