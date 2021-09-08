import 'package:flutter/material.dart';
import 'package:gems/splash.dart';
import 'package:gems/webview_container.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'GEMS Property Services',
        debugShowCheckedModeBanner: false,
        home: SplashScreen() //WebViewContainer(),
        );
  }
}
