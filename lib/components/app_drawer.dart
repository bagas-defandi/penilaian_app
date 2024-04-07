import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key, this.isAdmin = true});

  final bool isAdmin;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItems(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 44.0,
      ),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, "/home");
            },
          ),
          (isAdmin)
              ? ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Juri'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, "/manage-juri");
                  },
                )
              : Container(),
          ListTile(
            leading: const Icon(Icons.logout_outlined),
            title: const Text('Logout'),
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, "/auth");
            },
          ),
        ],
      ),
    );
  }
}
