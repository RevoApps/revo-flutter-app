// models/chat_models.dart
class Message {
  final String text;
  final bool isMe;
  final String time;
  final bool isRead;

  Message({
    required this.text,
    required this.isMe,
    required this.time,
    this.isRead = false,
  });
}

class Chat {
  final String name;
  final String lastMessage;
  final String time;
  final String avatar;
  final int unreadCount;
  final bool isOnline;
  final List<Message> messages;

  Chat({
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.avatar,
    this.unreadCount = 0,
    this.isOnline = false,
    required this.messages,
  });
}
