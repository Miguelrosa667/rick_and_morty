import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(DevicePreview(builder: (context) => MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});