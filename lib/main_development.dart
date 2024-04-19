import 'package:appgain_task/colors.dart';
import 'package:appgain_task/features/home/home.dart';
import 'package:appgain_task/service/firebase_api.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FireBaseApi().initNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MoviesApp',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: ColorsApp.scaffoldBgColor,
      ),
      home: const HomeScreen(),
    );
  }
}
