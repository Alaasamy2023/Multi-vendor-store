import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app/screen/home_screen.dart';
import 'constant/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ' Store',
      theme: ThemeData(
        textTheme: GoogleFonts.almaraiTextTheme(Theme.of(context).textTheme),
        primaryColor: kPrimaryColor,
        // ignore: deprecated_member_use
        accentColor: kPrimaryColor,
      ),
      // Arabic RTL
      // ignore: prefer_const_literals_to_create_immutables
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [Locale("ar", "AE")],
      // ignore: prefer_const_constructors
      locale: Locale("ar", "AE"),

      home: const HomeScreen(),
    );
  }
}
