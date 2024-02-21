import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharmaco/Pages/PharmaDash.dart';
import 'package:pharmaco/Pages/login.dart'; 

class PharmacistHome extends StatefulWidget {
  final String splashScreenPath; 
  const PharmacistHome({super.key, required this.splashScreenPath}); // Constructor with splashScreenPath parameter
  @override
  State<PharmacistHome> createState() => _PharmacistHomeState();
}

class _PharmacistHomeState extends State<PharmacistHome> {
  final User user = FirebaseAuth.instance.currentUser!;
  String currentPage = 'Home';

  void signUserOut(BuildContext context) async {
    print('asdasd');
    try {
      print('asdasd');
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
          color: currentPage == title ? Colors.pinkAccent[200] : Colors.black,
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
      String substringBeforeAt = s.substring(0, atIndex);
      String stringWithoutNumbers =
          substringBeforeAt.replaceAll(RegExp(r'\d'), '');
      return stringWithoutNumbers;
    }

    return s;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 213, 223),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 241, 97, 145),
        title: const Text('Pharmacist Dashboard'),
        actions: [
          IconButton(
            onPressed: () => signUserOut(context),
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.pinkAccent[100],
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
              buildDrawerItem('Home', Icons.home_filled,const PharmacistHome(splashScreenPath: 'lib/Pages/splash_screen.dart')),
              buildDrawerItem('View', Icons.medication, const PharmaDash()),
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
