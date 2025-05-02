import 'package:flutter/material.dart';

class GuideDashboardScreen extends StatelessWidget {
  const GuideDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Welcome message
        Text(
          'Welcome, Guide!',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 24),

        // Availability Card
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'My Availability',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        // TODO: Edit availability
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text('Available Weekends'),
                const Text('9:00 AM - 5:00 PM'),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Incoming Requests Card
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Incoming Requests',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    TextButton(
                      onPressed: () {
                        // TODO: View all requests
                      },
                      child: const Text('View All'),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.person)),
                  title: const Text('Sarah Parker'),
                  subtitle: const Text('Request for July 15'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.check_circle_outline),
                        onPressed: () {
                          // TODO: Accept request
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.cancel_outlined),
                        onPressed: () {
                          // TODO: Decline request
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Rating Card
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Rating',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 32),
                    const SizedBox(width: 8),
                    Text(
                      '4.8',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '(124 reviews)',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
