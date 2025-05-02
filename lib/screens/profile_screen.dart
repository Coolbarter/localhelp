import 'package:flutter/material.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Profile Header
        Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/face.jpg'),
              ),
              const SizedBox(height: 16),
              Text(
                'John Doe',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                'john.doe@example.com',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        const Divider(),

        // Profile Options
        ListTile(
          leading: const Icon(Icons.edit),
          title: const Text('Edit Profile'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const EditProfileScreen()),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Account Settings'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            // TODO: Navigate to account settings
          },
        ),
        ListTile(
          leading: const Icon(Icons.library_books),
          title: const Text('Community Guidelines'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            // TODO: Show community guidelines
          },
        ),
        ListTile(
          leading: const Icon(Icons.security),
          title: const Text('Safety Center'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            // TODO: Navigate to safety center
          },
        ),
        const Divider(),

        // Log Out Option
        ListTile(
          leading: Icon(
            Icons.logout,
            color: Theme.of(context).colorScheme.error,
          ),
          title: Text(
            'Log Out',
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
          onTap: () {
            // TODO: Implement logout
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
        ),
      ],
    );
  }
}
