import 'package:bashment_app/constants.dart';
import 'package:bashment_app/screens/home_page.dart';
import 'package:bashment_app/screens/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("Error ${snapshot.error}"),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, stream_snapshot) {
              if (stream_snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("Error ${stream_snapshot.error}"),
                  ),
                );
              }
              if (stream_snapshot.connectionState == ConnectionState.active) {
                User _user = stream_snapshot.data;
                if(_user == null){
                  return LoginPage();
                } else {
                  return HomePage();
                }
              }
              return Scaffold(
                body: Center(
                  child: Text("Checking Authentication..."),
                ),
              );
            },
          );
        }

        return Scaffold(
          body: Center(
            child: Text("Initializing app..."),
          ),
        );
      },
    );
  }
}
