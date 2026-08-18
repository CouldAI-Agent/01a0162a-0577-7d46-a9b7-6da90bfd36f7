import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const PerevodApp());
}

class PerevodApp extends StatelessWidget {
  const PerevodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'O\'qishni Ko\'chirish Qoidalari',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1565C0), // Deep blue theme for education
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
      },
    );
  }
}
