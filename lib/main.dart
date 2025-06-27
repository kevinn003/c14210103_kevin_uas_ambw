import 'package:c14210103_kevin_uas_ambw/recipe_list_page.dart';
import 'package:c14210103_kevin_uas_ambw/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'signup_page.dart';
import 'login_page.dart';
import 'get_started_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp (
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // final prefs = await SharedPreferences.getInstance();
  // final isFirstTime = prefs.getBool('isFirstTime') ?? true;
  // final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  // final bool isFirstTime;
  // final bool isLoggedIn;
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UAS AMBW Simple Recipe Keeper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SplashScreen()
    );
  }
}
