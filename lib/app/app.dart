import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:synapse/clasroom/pages/classroom_page.dart';
import 'package:synapse/login/pages/login_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Synapse App',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(59, 77, 63, 1),
            primary: Colors.green,
            secondary: Colors.white,
          ),
          textTheme: TextTheme(
            headlineLarge: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary),
            headlineMedium: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w100,
            ),
          ),
          useMaterial3: true,
          fontFamily: GoogleFonts.poppins().fontFamily),
      // home: const LoginPage(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "/": (BuildContext context) => const LoginPage(),
        "/classes": (BuildContext context) => const ClassroomPage()
      },
    );
  }
}
