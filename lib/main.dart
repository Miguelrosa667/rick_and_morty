import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(DevicePreview(builder: (context) => MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick and Morty App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF22C55E),
        scaffoldBackgroundColor: const Color(0xFF121212),
      ),