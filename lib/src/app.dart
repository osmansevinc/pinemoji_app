import 'package:flutter/material.dart';
import 'package:pinemoji_app/src/presentation/pages/number_trivia_page.dart';

class App extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Number Trivia',
      theme:ThemeData(
          primaryColor:Colors.green.shade800,
        accentColor: Colors.green.shade600
      ),
      home: NumberTriviaPage()
    );
  }
}