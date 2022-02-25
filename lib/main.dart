import 'package:dash/home.dart';
import 'package:dash/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

final theme = AppTheme.light();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const Scaffold(body: Home()),
    );
  }
}

