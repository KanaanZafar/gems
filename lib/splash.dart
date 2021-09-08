import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:gems/error_screen.dart';
import 'package:gems/webview_container.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  DatabaseReference dbref = FirebaseDatabase.instance.reference();
  bool hasPermission;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }

  readFirebase() async {
    DataSnapshot dataSnapshot = await dbref.child("allow").once();
    hasPermission = dataSnapshot.value;
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (ctx) =>
                hasPermission ? WebViewContainer() : ErrorScreen()),
        (route) => false);
  }
}
