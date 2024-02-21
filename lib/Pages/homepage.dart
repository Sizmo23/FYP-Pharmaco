import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharmaco/Pages/Dashboard.dart';
import 'package:pharmaco/Pages/login.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final user = FirebaseAuth.instance.currentUser!;
  String currentPage = 'Home';

  void signUserOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => login(),
      ));
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  ListTile buildDrawerItem(String title, IconData icon, Widget destination) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 23,
          color: currentPage == title ? Colors.blueAccent : Colors.black,
        ),
      ),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => destination));

        // Update the current active page
        setState(() {
          currentPage = title;
        });
      },
    );
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
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () => signUserOut(context),
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
            buildDrawerItem('Home', Icons.home_filled, Home()),
            buildDrawerItem('Search', Icons.search, const Dashboardpage()),
          ],
        ),
      )),
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