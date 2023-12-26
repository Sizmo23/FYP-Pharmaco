import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharmaco/Pages/Dashboard.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final user = FirebaseAuth.instance.currentUser!;
  void signUserOut() {
    print('wwwwwwoooooo');
    FirebaseAuth.instance.signOut();
    print('asdsss');
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
        title: const Text('Dashboard'),
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
                'Nav',
                style: TextStyle(fontSize: 25),
              ),
            )),
            ListTile(
              leading: const Icon(Icons.search),
              title: const Text(
                'Search',
                style: TextStyle(fontSize: 23),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Dashboardpage()));
              },
            )
          ],
        ),
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment
              .start, 
          crossAxisAlignment:
              CrossAxisAlignment.center, 
          children: [
            const Padding(
              padding:
                  EdgeInsets.only(top: 20), 
              child: Image(
                image: AssetImage('lib/images/pharmacologo.png'),
                height: 339,
                width: 339,
              ),
            ),
            Text(
              "Welcome ${create(user.email!)}!",
              style: const TextStyle(fontSize: 40),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
