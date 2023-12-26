import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharmaco/Pages/PharmaDash.dart'; // Update with your actual file name

class PharmacistHome extends StatelessWidget {
  final User user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  String create(String s) {
    int atIndex = s.indexOf('@');

    if (atIndex != -1) {
      return s.substring(0, atIndex);
    }

    return s;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 212, 227, 241),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[200],
        title: const Text('Pharmacist Dashboard'),
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.blue[100],
          child: ListView(
            children: [
              const DrawerHeader(
                child: Center(
                  child: Text(
                    'Pharmacist Nav',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.search),
                title: const Text(
                  'View',
                  style: TextStyle(fontSize: 23),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const PharmaDash()));
                },
              )
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Image(
                image: AssetImage('lib/images/pharmacologo.png'),
                height: 339,
                width: 339,
              ),
            ),
            Text(
              "Welcome Mr.${create(user.email!)}!",
              style: const TextStyle(fontSize: 40),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
