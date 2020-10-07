import 'package:flutter/material.dart';
import 'package:emirates_app/home_page.dart';
import 'package:emirates_app/welcome_screen.dart';
import 'package:framy_annotation/framy_annotation.dart';
import 'display/header.dart';
import 'display/custom_drawer.dart';
import 'display/custom_drawer_guitar.dart';
import 'package:emirates_app/detail-screen.dart';
import 'package:emirates_app/add_flight_screen.dart';
//import 'package:device_preview/device_preview.dart';
import 'package:emirates_app/testdraw.dart';

void main() {
  runApp(MyApp());
}

@FramyApp(useDevicePreview: true) //<---- Add this annotation
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool flip = false;
    Header header = flip ? Header() : Header();
    Widget child = HomePage(header: header);
    if (flip) {
      child = CustomGuitarDrawer(child: child);
    } else {
      child = CustomDrawer(child: child);
    }
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ).copyWith(
        pageTransitionsTheme: PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
              TargetPlatform.android: ZoomPageTransitionsBuilder(),
            }),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        HomePage.id: (context) => child,
        DetailScreen.id: (context) => DetailScreen(),
        AddFlightScreen.id: (context) => AddFlightScreen(),
        TestDraw.id: (context) => TestDraw(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

//Use framy together with device preview or,
//Use device preview seprate, more on device preview pub.dev
