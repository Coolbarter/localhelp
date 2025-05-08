import 'package:flutter/material.dart';
import 'chat_screen.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10, // Placeholder count
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final name = 'Chat User $index';
        return ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ChatScreen(otherUserName: name),
              ),
            );
          },
          leading: const CircleAvatar(
            backgroundImage: AssetImage('assets/images/face.jpg'),
          ),
          title: Text(name),
          subtitle: const Text('Last message preview...'),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('10:30 AM', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: 4),
              if (index % 3 == 0) // Show unread indicator on some messages
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '2',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 12,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
