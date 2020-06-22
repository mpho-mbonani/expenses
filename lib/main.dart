import 'package:flutter/material.dart';
import 'widgets/home.dart';

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
        home: Home(),
        theme: ThemeData(
          backgroundColor: Colors.white,
          primarySwatch: Colors.yellow,
          accentColor: Colors.black,
          appBarTheme:
              ThemeData.light().appBarTheme.copyWith(color: Colors.white),
          fontFamily: 'OpenSans',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ));
  }
}
