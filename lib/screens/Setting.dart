import 'package:flutter/material.dart';

void main() {
  runApp(const SettingsPage());
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(), // Dark theme applied
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Setting'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.code, color: Colors.green),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          color: Colors.white, // White background color
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                // Personal Info Section
                buildSectionTitle('Personal Info'),
                buildSettingItem(Icons.person, 'Your profile'),
                buildSettingItem(Icons.history, 'Medical Record History'),
                const Divider(color: Colors.grey),

                // Security Section
                buildSectionTitle('Security'),
                buildSettingItem(Icons.lock, 'Change password'),
                buildSettingItem(Icons.lock_open, 'Forgot password'),
                const Divider(color: Colors.grey),

                // General Section
                buildSectionTitle('General'),
                buildSettingItem(Icons.notifications, 'Notification'),
                buildSettingItem(Icons.language, 'Languages'),
                buildSettingItem(Icons.help, 'Help and Support'),
                buildSettingItem(Icons.logout, 'Log Out'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper widget to build section titles
  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Helper widget to build list items
  Widget buildSettingItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon,
              size: 24, color: Colors.black), // Change icon color to black
          const SizedBox(width: 16),
          Text(
            title,
            style: const TextStyle(
                fontSize: 16,
                color: Colors.black), // Change text color to black
          ),
        ],
      ),
    );
  }
}
