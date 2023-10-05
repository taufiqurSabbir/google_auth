import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'authentication.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(APP());
}


class APP extends StatelessWidget {
  const APP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}




class LoginScreen extends StatelessWidget {
  final AuthenticationService _auth = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login with Google'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final user = await _auth.signInWithGoogle();
            log(user.toString());
            if (user != null) {
              // User signed in successfully
              print('User ID: ${user.uid}');
            } else {
              // Sign-in failed
              print('Sign-in failed.');
            }
          },
          child: Text('Sign in with Google'),
        ),
      ),
    );
  }
}
