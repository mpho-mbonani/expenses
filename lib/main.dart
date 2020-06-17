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
        backgroundColor: Colors.white,
        primarySwatch: Colors.yellow,
        accentColor: Colors.black,
        appBarTheme:
            ThemeData.light().appBarTheme.copyWith(color: Colors.white),
        fontFamily: 'OpenSans',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
        backgroundColor: Colors.black,
        primarySwatch: Colors.yellow,
        accentColor: Colors.white,
        appBarTheme: ThemeData.dark().appBarTheme.copyWith(color: Colors.black),
        fontFamily: 'OpenSans',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
