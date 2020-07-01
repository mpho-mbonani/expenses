import 'package:flutter/material.dart';
import 'widgets/primary.dart';

void main() {
  // Portrait mode only
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Primary(),
      theme: ThemeData(
        backgroundColor: Colors.white,
        primarySwatch: Colors.grey,
        accentColor: Colors.black,
        appBarTheme:
            ThemeData.light().appBarTheme.copyWith(color: Colors.white),
        fontFamily: 'OpenSans',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
