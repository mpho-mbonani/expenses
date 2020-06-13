import 'package:flutter/material.dart';
import 'widgets/primary.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses',
      home: Primary(),
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        accentColor: Colors.black,
        fontFamily: 'OpenSans',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
