import 'package:appgain_task/core/utils/colors.dart';
import 'package:appgain_task/features/home/presentation/view/home.dart';
import 'package:flutter/material.dart';

void main() {
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
