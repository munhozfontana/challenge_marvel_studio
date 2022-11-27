import 'package:challenge_marvel_studio/src/core/injection.dart';
import 'package:challenge_marvel_studio/src/core/routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    var themeData = ThemeData(
      primarySwatch: Colors.blue,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        color: Colors.transparent,
        elevation: 0,
      ),
    );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData,
      routes: routing,
    );
  }
}
