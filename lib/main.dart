import 'package:flutter/material.dart';

import 'pages/home/indexPage.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sefyedeksan',
        theme: ThemeData(primaryColor: Colors.blue.shade400),
        home: const HomePage());
  }
}

