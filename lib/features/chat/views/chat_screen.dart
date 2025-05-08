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
          color:
              isMe
                  ? Theme.of(context).colorScheme.primaryContainer
                  : Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(AppTheme.borderRadiusLg),
        ),
        child: Text(
          message,
          style: TextStyle(
            color:
                isMe
                    ? Theme.of(context).colorScheme.onPrimaryContainer
                    : Theme.of(context).colorScheme.onSecondaryContainer,
          ),
        ),
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  final String otherUserName;

  const ChatScreen({super.key, required this.otherUserName});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: colorScheme.surfaceContainerHighest,
              backgroundImage: const AssetImage('assets/images/1.jpg'),
            ),
            const SizedBox(width: AppTheme.paddingSm),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.otherUserName, style: textTheme.titleMedium),
                Text(
                  'Online',
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.paddingMd,
                vertical: AppTheme.paddingLg,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                final bool isMe = index % 2 == 0;
                return _buildMessageBubble(context, isMe);
              },
            ),
          ),
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
                          borderRadius: BorderRadius.circular(
                            AppTheme.borderRadiusLg,
                          ),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: colorScheme.surfaceContainerHighest.withOpacity(0.5),
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
                    icon: const Icon(Icons.send_rounded),
                    style: IconButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      foregroundColor: colorScheme.onPrimary,
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

  Widget _buildMessageBubble(BuildContext context, bool isMe) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: AppTheme.paddingMd),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isMe) ...[
            CircleAvatar(
              radius: 16,
              backgroundColor: colorScheme.surfaceContainerHighest,
              backgroundImage: const AssetImage('assets/images/1.jpg'),
            ),
            const SizedBox(width: AppTheme.paddingSm),
          ],
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: AppTheme.paddingMd,
              vertical: AppTheme.paddingSm,
            ),
            decoration: BoxDecoration(
              color: isMe ? colorScheme.primary : colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(AppTheme.borderRadiusLg),
                topRight: const Radius.circular(AppTheme.borderRadiusLg),
                bottomLeft: Radius.circular(isMe ? AppTheme.borderRadiusLg : 4),
                bottomRight: Radius.circular(
                  isMe ? 4 : AppTheme.borderRadiusLg,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'This is a sample message that might be a bit long to test the bubble.',
                  style: textTheme.bodyMedium?.copyWith(
                    color:
                        isMe
                            ? colorScheme.onPrimary
                            : colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '12:34 PM',
                  style: textTheme.labelSmall?.copyWith(
                    color:
                        isMe
                            ? colorScheme.onPrimary.withOpacity(0.7)
                            : colorScheme.onSurfaceVariant.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
          if (isMe) const SizedBox(width: AppTheme.paddingSm),
        ],
      ),
    );
  }
}
