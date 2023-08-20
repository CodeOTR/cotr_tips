import 'package:cotr_tips/tips/color_tip.dart';
import 'package:cotr_tips/tips/value_notifier_tip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue, textTheme: const TextTheme(bodyMedium: TextStyle(fontSize: 24))),
      home: const ValueNotifierTip(),
    );
  }
}
