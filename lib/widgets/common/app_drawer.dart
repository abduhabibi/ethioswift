import 'package:flutter/material.dart';
import 'package:ethio_swift/main.dart'; 

class AppDrawer extends StatelessWidget {
  final String userName;
  final String userPhone;

  const AppDrawer({
    super.key,
    this.userName = "Abebe K.",
    this.userPhone = "+251 911 234 567",
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(userName, style: const TextStyle(fontSize: 18)),
            accountEmail: Text(userPhone),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: kPrimaryColor, size: 40),
            ),
            decoration: const BoxDecoration(color: kPrimaryColor),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () => Navigator.popAndPushNamed(context, '/home'),
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('My Trips'),
            onTap: () => Navigator.popAndPushNamed(context, '/my_trips'),
          ),
          ListTile(
            leading: const Icon(Icons.wallet_outlined),
            title: const Text('Wallet'),
            onTap: () => Navigator.popAndPushNamed(context, '/wallet'),
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Settings'),
            onTap: () => Navigator.popAndPushNamed(context, '/settings'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('Help & Support'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Logout', style: TextStyle(color: Colors.red)),
            onTap: () => Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false),
          ),
        ],
      ),
    );
  }
}
