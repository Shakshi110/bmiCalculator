import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'input_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.grey
  ));
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI CALCULATOR',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color(0xFF0A0E21),
          appBarTheme: AppBarTheme(
          color: Color(0xFF0A0E21),
            //for status bar
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.grey,
                    systemNavigationBarColor: Color(0xFF0A0E21)
            )
        ),
          textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.white,fontSize: 30),
      ),
      ),
        home: MyHomePage()
    );
  }
}

