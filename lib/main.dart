import 'package:flutter/material.dart';
import 'package:shared_preference/shared_preferences_service.dart';
import 'package:shared_preference/view/hive_service.dart';
import 'package:shared_preference/view/login_page.dart';
import 'package:shared_preference/view/navigation.dart';
import 'package:shared_preference/view/register_page.dart';

void main() async {
  HiveService hiveService = HiveService();
  await hiveService.initHive();

  SharedPreferencesService sharedPreferencesService =
      SharedPreferencesService();
  bool isLoggedIn = await sharedPreferencesService.isLoggedIn();

  runApp(MyApp(
    isLoggedIn: isLoggedIn,
  ));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  MyApp({required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your App Name',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isLoggedIn ? const NavPage() : LoginPage(),
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => NavPage(),
      },
    );
  }
}
