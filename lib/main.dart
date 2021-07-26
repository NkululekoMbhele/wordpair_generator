import 'package:flutter/material.dart';
import './random_words.dart';



// adding comments
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wordpair Generator',
      home: RandomWords(),
    );
  }
}




