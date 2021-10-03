import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_tracker/screens/signin_page.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoSansTextTheme(
          Theme.of(context).textTheme,
        ),
        primaryColor: const Color(0xff5B428F),
        primaryColorDark: const Color(0xff262833),
        primaryColorLight: const Color(0xffFCF9F5),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: const Color(0xffF56D58)),
      ),
      darkTheme: ThemeData(
        textTheme: GoogleFonts.nunitoSansTextTheme(
          Theme.of(context).textTheme,
        ),
        primaryColor: const Color(0xff5B428F),
        primaryColorDark: const Color(0xffFFFFFF),
        primaryColorLight: const Color(0xff000000),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: const Color(0xffF56D58)),
      ),
      home: const SignInPage(),
    );
  }
}
