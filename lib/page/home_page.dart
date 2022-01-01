import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_auth/signup.dart';
import 'package:google_auth/widget/logged%20in.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return Center(child: CircularProgressIndicator());
            else if (snapshot.hasData) {
              return LoggedIn();
            }
            else if (snapshot.hasData) {
              return Center(child: Text("Something Went Wrong!"),);
            }
            else {
              return Signup();
            }
          }
        )
      );
}

