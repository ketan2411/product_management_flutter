import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:productmanagement/introscreen.dart';

import 'homescreen.dart';
import 'login.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );
    // const color = const Color(0xff512DA8);
    return MaterialApp(
      title: 'Introduction screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.deepPurple,
        accentColor: Colors.cyan[600],
        backgroundColor: Colors.redAccent,

      ),
      routes: {
        '/home': (context) => homescreen(),
        '/login': (context) => login(),
      },
      home: introscreen(),
    );
  }
}



