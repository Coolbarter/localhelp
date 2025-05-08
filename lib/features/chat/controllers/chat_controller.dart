import 'package:flutter/material.dart';
import '../models/message_model.dart';

class ChatController extends ChangeNotifier {
  final Map<String, List<ChatMessage>> _chats = {};
  bool _isLoading = false;
  String? _error;

  bool get isLoading => _isLoading;
  String? get error => _error;

  List<ChatMessage> getMessages(String otherUserId) {
    return _chats[otherUserId] ?? [];
  }

  Future<void> loadChat(String otherUserId) async {
    try {
      _isLoading = true;
      notifyListeners();

      await Future.delayed(const Duration(seconds: 1));
      _chats[otherUserId] = [
        ChatMessage(
          id: '1',
          senderId: otherUserId,
          receiverId: 'currentUserId',
          content: 'Hello! I\'m interested in booking a tour.',
          timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
        ),
      ];

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> sendMessage(String receiverId, String content) async {
    try {
      // TODO: Implement API call to send message
      final message = ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        senderId: 'currentUserId',
        receiverId: receiverId,
        content: content,
        timestamp: DateTime.now(),
      );

      _chats[receiverId] ??= [];
      _chats[receiverId]!.add(message);
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  void markAsRead(String otherUserId) {
    final messages = _chats[otherUserId];
    if (messages != null) {
      for (var message in messages) {
        if (message.receiverId == 'currentUserId' && !message.isRead) {
          // In a real app, we would update this on the server
          final updatedMessage = ChatMessage(
            id: message.id,
            senderId: message.senderId,
            receiverId: message.receiverId,
            content: message.content,
            timestamp: message.timestamp,
            isRead: true,
          );
          final index = messages.indexOf(message);
          messages[index] = updatedMessage;
        }
      }
      notifyListeners();
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
