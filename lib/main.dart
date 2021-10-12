import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_application_1/utilities/utils.dart';
import 'package:flutter_application_1/views/home_view.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,

      title: 'Todo',
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: const Color.fromRGBO(249, 251, 255, 1),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: customBlue),
          titleTextStyle: TextStyle(
            color: customBlue,
            fontSize: 21,
            fontWeight: FontWeight.w600,
          ),
          actionsIconTheme: IconThemeData(
            color: customBlue,
          ),
        ),
      ),

      // darkTheme: ThemeData.dark().copyWith(
      //   textTheme: const TextTheme(
      //     bodyText1: TextStyle(color: Colors.white,
      //     )
      //   ),
      //   shadowColor: Colors.black38,
      //   primaryColor: Colors.black,
      //   scaffoldBackgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      //   appBarTheme: const AppBarTheme(
      //     backgroundColor: Colors.black,
      //     elevation: 0,
      //     titleTextStyle: TextStyle(
      //       color: Colors.white,
      //       fontSize: 21,
      //       fontWeight: FontWeight.w600,
      //     ),
      //     actionsIconTheme: IconThemeData(
      //       color: Colors.white,
      //     ),
      //   ),
      //   bottomNavigationBarTheme: BottomNavigationBarThemeData(
      //     backgroundColor: Colors.grey.shade600,
      //   ),
      //   floatingActionButtonTheme: const FloatingActionButtonThemeData(
      //     backgroundColor: Colors.grey,
      //   ),
      // ),
      themeMode: ThemeMode.system,
      home: const HomeView(),
    );
  }
}
