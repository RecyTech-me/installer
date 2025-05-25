import 'package:flutter/material.dart';
import 'package:recytech_welcome/pages/home.dart';

void main() {
  runApp(const RecyTechApp());
}

class RecyTechApp extends StatelessWidget {
  const RecyTechApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RecyTech',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFE8DFC9),
        primaryColor: const Color(0xFF4F6F52),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF4F6F52),
          onPrimary: Color(0xFFE8DFC9),
          background: Color(0xFFE8DFC9),
          onBackground: Color(0xFF4F6F52),
        ),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFF4F6F52),
          ),
          bodyMedium: TextStyle(fontSize: 18, color: Color(0xFF4F6F52)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4F6F52),
            foregroundColor: const Color(0xFFE8DFC9),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            textStyle: const TextStyle(fontSize: 18),
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xFF4F6F52)),
      ),
      home: const Home(),
    );
  }
}
