import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:productmanagement/introscreen.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    return MaterialApp(
      title: 'Introduction screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.deepPurple,
        accentColor: Colors.cyan[600],
        backgroundColor: Colors.redAccent,
      ),
      home: introscreen(),
    );
  }
}

