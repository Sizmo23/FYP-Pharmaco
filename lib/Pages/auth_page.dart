import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharmaco/Pages/Pharma.dart';
import 'package:pharmaco/Pages/PharmaDash.dart';
import 'package:pharmaco/Pages/SignUp.dart';
import 'package:pharmaco/Pages/homepage.dart';
import 'package:pharmaco/Pages/login.dart';

class auth_page extends StatelessWidget {
  const auth_page({Key? key});

  void route(BuildContext context, User user) {
    FirebaseFirestore.instance
        .collection('Users')
        .doc(user.email)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('role') == "Pharmacist") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => PharmacistHome(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ),
          );
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // User logged in?
          if (snapshot.hasData) {
            User user = snapshot.data!;
            route(context, user);
          } else if (snapshot.hasError) {
            // Weird error
            return const Center(child: Text('Error Has Occurred!'));
          }
          // User not logged in, show SignUp page
          return SignUp();
        },
      ),
    );
  }
}
