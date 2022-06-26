// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'views/customer_view.dart';

void main() {
  runApp(const FlutterMvvmApp1());
}

class FlutterMvvmApp1 extends StatelessWidget {
  const FlutterMvvmApp1({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MVVM 1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeView(title: 'Flutter MVVM 1'),
      debugShowCheckedModeBanner: false,
    );
  }
}
