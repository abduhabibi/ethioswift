import 'package:flutter/material.dart';
import 'package:ethio_swift/widgets/common/app_drawer.dart';
import 'package:ethio_swift/main.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      drawer: const AppDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSettingsSection(
            context,
            'Account Settings',
            [
              _buildSettingsItem(context, Icons.person_outline, 'Profile Information', onTap: () {}),
              _buildSettingsItem(context, Icons.lock_outline, 'Change Password / PIN', onTap: () {}),
              _buildSettingsItem(context, Icons.email_outlined, 'Manage Notifications', onTap: () {}), // CHANGED: {} to () {}
            ],
          ),
          _buildSettingsSection(
            context,
            'App Preferences',
            [
              _buildSettingsSwitchItem(context, Icons.location_on_outlined, 'Location Tracking', true, (bool value) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Location Tracking set to $value')));
              }),
              _buildSettingsSwitchItem(context, Icons.dark_mode_outlined, 'Dark Mode', false, (bool value) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Dark Mode set to $value')));
              }),
              _buildSettingsItem(context, Icons.language, 'Language (English)', onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Opening language selection...')));
              }),
            ],
          ),
          _buildSettingsSection(
            context,
            'Legal & Support',
            [
              _buildSettingsItem(context, Icons.info_outline, 'About EthioSwift', onTap: () {}),
              _buildSettingsItem(context, Icons.policy_outlined, 'Privacy Policy', onTap: () {}),
              _buildSettingsItem(context, Icons.call_outlined, 'Contact Support', onTap: () {}), // CHANGED: {} to () {}
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildSettingsSection(BuildContext context, String title, List<Widget> items) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),
          ),
          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: items.map((item) => Padding(
                padding: EdgeInsets.only(top: item == items.first ? 0 : 0),
                child: item,
              )).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(BuildContext context, IconData icon, String title, {VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: kPrimaryColor),
      title: Text(title, style: const TextStyle(color: kTextColor)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }

  Widget _buildSettingsSwitchItem(BuildContext context, IconData icon, String title, bool value, ValueChanged<bool> onChanged) {
    return SwitchListTile(
      secondary: Icon(icon, color: kPrimaryColor),
      title: Text(title, style: const TextStyle(color: kTextColor)),
      value: value,
      onChanged: onChanged,
      activeColor: kPrimaryColor,
    );
  }
}
