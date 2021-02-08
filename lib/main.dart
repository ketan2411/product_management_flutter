import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'components/intro_screen.dart';
import 'homescreen.dart';
import 'login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dynamicList.dart';

int initscreen;

Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initscreen = await prefs.getInt('initscreen');
  await prefs.setInt('initscreen', 1);
  runApp(App());

}


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
        '/intro': (context) => IntroScreen(),
        '/dynamicList': (context) => dynamicList(),

      },
      initialRoute: initscreen == 0 || initscreen == null ? '/intro': '/login',
    );
  }
}



