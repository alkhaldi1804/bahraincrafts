import 'package:flutter/material.dart';
import 'home_page.dart'; // 👈 هذا مهم جداً

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Made in Bahrain',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFC8102E),
        ),
      ),
      home: HomePage(), // بدون const
    );
  }
}
