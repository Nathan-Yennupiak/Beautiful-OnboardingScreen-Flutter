import 'package:flutter/material.dart';
import 'package:onboarding_screen/views/home_page.dart';
import 'package:onboarding_screen/views/onboarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

int? isviewed;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('OnboardingPage');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isviewed != 0 ? OnboardingPage() : HomePage(),
    );
  }
}
