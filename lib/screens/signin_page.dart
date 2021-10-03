import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_tracker/services/authentication_services.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  AuthenticationClass authenticationClass = AuthenticationClass();

  signInWithGoogle() async {
    await authenticationClass.googleSignIn(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: MaterialButton(
          color: Theme.of(context).primaryColor,
          onPressed: () {
            signInWithGoogle();
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Sign In With Google',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColorDark,
              ),
            ),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
