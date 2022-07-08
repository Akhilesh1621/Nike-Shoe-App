import 'package:flutter/material.dart';
import 'package:shoe_app/data/data.dart';
import 'package:shoe_app/screen/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(
        shoesize: shoesize,
        genderlist: gender,
      ),
    );
  }
}
