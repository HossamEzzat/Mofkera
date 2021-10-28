import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Screen/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MOFKERA',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.akronimTextTheme(),
      ),
      home: HomeScreen(),
    );
  }
}

