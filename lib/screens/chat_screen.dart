import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/app_theme.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isMe;

  const ChatBubble({super.key, required this.message, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(
          left: isMe ? AppTheme.paddingLg * 4 : AppTheme.paddingMd,
          right: isMe ? AppTheme.paddingMd : AppTheme.paddingLg * 4,
          top: AppTheme.paddingSm / 2,
          bottom: AppTheme.paddingSm / 2,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppTheme.paddingMd,
          vertical: AppTheme.paddingMd - 6,
        ),
        decoration: BoxDecoration(
          color: isMe
              ? Theme.of(context).colorScheme.primaryContainer
              : Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(AppTheme.borderRadiusLg),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: isMe
                ? Theme.of(context).colorScheme.onPrimaryContainer
                : Theme.of(context).colorScheme.onSecondaryContainer,
          ),
        ),
      ),
    );
  }
}

class ChatScreen extends StatelessWidget {
  final String otherUserName;

  const ChatScreen({super.key, required this.otherUserName});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Placeholder messages
    final messages = [
      {'message': 'Hi, I\'m interested in a tour!', 'isMe': true},
      {
        'message':
            'Hello! I\'d be happy to help. When are you planning to visit?',
        'isMe': false,
      },
      {
        'message': 'I\'ll be there next week, from Monday to Friday',
        'isMe': true,
      },
      {
        'message': 'Perfect! I\'m available on Tuesday and Wednesday',
        'isMe': false,
      },
      {'message': 'How about Tuesday morning?', 'isMe': true},
      {'message': 'Sounds good! Let\'s meet at 9 AM', 'isMe': false},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=1'),
              onBackgroundImageError: (exception, stackTrace) {},
            ),
            const SizedBox(width: AppTheme.paddingMd),
            Text(otherUserName),
          ],
        ),
      ),
      body: Column(
        children: [
          // Messages List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return ChatBubble(
                  message: message['message'] as String,
                  isMe: message['isMe'] as bool,
                );
              },
            ),
          ),

          // Message Input
          Container(
            padding: const EdgeInsets.all(AppTheme.paddingMd),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.shadow.withOpacity(0.08),
                  blurRadius: 4,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppTheme.borderRadiusLg),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: theme.colorScheme.surfaceVariant.withOpacity(0.5),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: AppTheme.paddingMd,
                          vertical: AppTheme.paddingMd - 4,
                        ),
                      ),
                      maxLines: null,
                    ),
                  ),
                  const SizedBox(width: AppTheme.paddingMd),
                  IconButton(
                    onPressed: () {
                      // TODO: Send message
                    },
                    icon: const Icon(Icons.send),
                    style: IconButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: theme.colorScheme.onPrimary,
                      padding: const EdgeInsets.all(AppTheme.paddingMd),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
