import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../screen/login/login_screen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: Colors.yellow.shade300,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Text(
              'Hello, ${user?.email ?? 'Guest'}!',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                _buildSettingsOption(
                  context: context,
                  icon: Icons.account_circle,
                  title: 'Account Settings',
                  description: 'Manage your account details and preferences.',
                ),
                _buildSettingsOption(
                  context: context,
                  icon: Icons.notifications,
                  title: 'Notifications',
                  description: 'Control your notification preferences.',
                ),
                _buildSettingsOption(
                  context: context,
                  icon: Icons.lock,
                  title: 'Privacy Policy',
                  description: 'Review our privacy policy.',
                ),
                _buildSettingsOption(
                  context: context,
                  icon: Icons.help_outline,
                  title: 'Help & Support',
                  description: 'Get help and support for the app.',
                ),
                _buildSettingsOption(
                  context: context,
                  icon: Icons.info,
                  title: 'About Us',
                  description: 'Learn more about this app.',
                ),
                _buildSettingsOption(
                  context: context,
                  icon: Icons.logout,
                  title: 'Logout',
                  description: 'Sign out of your account.',
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                          (route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildSettingsOption({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String description,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(title),
              content: Text(description),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close'),
                ),
                if (onTap != null)
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      onTap();
                    },
                    child: const Text('Proceed'),
                  ),
              ],
            );
          },
        );
      },
    );
  }
}
