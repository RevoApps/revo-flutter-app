// models/message_types.dart
enum MessageType {
  homework,
  fee,
  results,
  notice,
  form,
  standard,
}

class MessageData {
  final String text;
  final bool isMe;
  final String time;
  final bool isRead;
  final MessageType type;
  final Map<String, dynamic>? metadata;

  MessageData({
    required this.text,
    required this.isMe,
    required this.time,
    this.isRead = false,
    this.type = MessageType.standard,
    this.metadata,
  });
}
