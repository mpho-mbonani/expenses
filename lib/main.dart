import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/primary.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Primary(),
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
