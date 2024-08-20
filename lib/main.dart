import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Freshly',
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MainView(),
    );
  }
}
