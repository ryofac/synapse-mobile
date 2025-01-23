import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:synapse/clasroom/pages/classroom_page.dart';
import 'package:synapse/login/pages/login_page.dart';
import 'package:synapse/login/pages/register_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Synapse App',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(136, 158, 115, 1),
            primary: const Color.fromRGBO(136, 158, 115, 1),
            secondary: const Color.fromRGBO(244, 215, 147, 1),
            surface: const Color.fromRGBO(255, 246, 218, 1),
            error: const Color.fromRGBO(169, 74, 74, 1),
            onPrimary: const Color.fromRGBO(255, 246, 218, 1),
          ),
          textTheme: TextTheme(
            headlineLarge: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary),
            headlineMedium: TextStyle(
              fontSize: 28,
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          useMaterial3: true,
          fontFamily: GoogleFonts.poppins().fontFamily),

      // home: const LoginPage(),
      debugShowCheckedModeBanner: false,

      routes: <String, WidgetBuilder>{
        "/": (BuildContext context) => const LoginPage(),
        "/classes": (BuildContext context) => const ClassroomPage(),
        "/register": (BuildContext context) => const RegisterPage()
      },
    );
  }
}
