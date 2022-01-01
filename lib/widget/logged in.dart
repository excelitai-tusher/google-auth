import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_auth/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class LoggedIn extends StatefulWidget {
  const LoggedIn({Key? key}) : super(key: key);

  @override
  _LoggedInState createState() => _LoggedInState();
}

class _LoggedInState extends State<LoggedIn> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title: Text("Logged In"),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: (){
                final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout();
              },
            child: Text("Logout",
            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 15
            ),
            ),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.blueGrey.shade900,
        child:  Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Text("Profile",
              style: TextStyle(
                fontSize: 24
              ),
              ),
              SizedBox(height: 20,),
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("images/tusher.jpeg"),
              ),
              SizedBox(height: 5,),
              // Text(
              //   "Abir Hossain Tusher",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 18,
              //   ),
              // ),
              SizedBox(height: 8,),
              Text('Name: ' + user!.displayName!,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 8,),
              Text('Email: ' + user!.email!,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
              ),
             ),
            ],
         ),
        ),
      ),
    );
  }
}
