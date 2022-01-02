import 'package:flutter/material.dart';

class ThemeDemoApp extends  StatelessWidget {
  const ThemeDemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ThemeDemoScreen()
    );
  }
}

class ThemeDemoScreen extends StatefulWidget {
  const ThemeDemoScreen({Key? key}) : super(key: key);

  @override
  _ThemeDemoScreenState createState() => _ThemeDemoScreenState();
}

class _ThemeDemoScreenState extends State<ThemeDemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
