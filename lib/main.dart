import 'package:flutter/material.dart';
import 'shopping_cart_page.dart';

void main() {
  runApp(const StatelessLabExamApp());
}

class StatelessLabExamApp extends StatelessWidget {
  const StatelessLabExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1E64EB),
          primary: const Color(0xFF1E64EB),
        ),
      ),
      home: const ShoppingCartPage(),
    );
  }
}
