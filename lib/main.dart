import 'package:dating_app/src/app.dart';
import 'package:dating_app/src/theme_manager/theme_data_manager.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const AppScreen();
  }
}

