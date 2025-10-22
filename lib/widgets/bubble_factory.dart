// widgets/bubble_factory.dart
import 'package:flutter/material.dart';
import '../models/message_types.dart';
import '../models/chat_models.dart';
import 'specialized_bubbles/homework_bubble.dart';
import 'specialized_bubbles/fee_bubble.dart';
import 'specialized_bubbles/results_bubble.dart';
import 'message_bubble.dart';

class BubbleFactory {
  static Widget createBubble(MessageData message) {
    switch (message.type) {
      case MessageType.homework:
        return HomeworkBubble(message: message);
      case MessageType.fee:
        return FeeBubble(message: message);
      case MessageType.results:
        return ResultsBubble(message: message);
      case MessageType.notice:
        return _createNoticeBubble(message);
      case MessageType.form:
        return _createFormBubble(message);
      case MessageType.standard:
        return MessageBubble(message: _convertToStandardMessage(message));
    }
  }

  static Widget _createNoticeBubble(MessageData message) {
    return Align(
      alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        constraints: const BoxConstraints(maxWidth: 300),
        decoration: BoxDecoration(
          color: message.isMe ? const Color(0xFFDCF8C6) : Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFF9C27B0), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Color(0xFF9C27B0),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
              ),
              child: const Row(
                children: [
                  Icon(Icons.campaign, color: Colors.white, size: 20),
                  SizedBox(width: 8),
                  Text(
                    'Important Notice',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(message.text, style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        message.time,
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                      if (message.isMe)
                        Icon(
                          message.isRead ? Icons.done_all : Icons.done,
                          size: 16,
                          color: message.isRead ? Colors.blue : Colors.grey,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _createFormBubble(MessageData message) {
    return Align(
      alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        constraints: const BoxConstraints(maxWidth: 300),
        decoration: BoxDecoration(
          color: message.isMe ? const Color(0xFFDCF8C6) : Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFF607D8B), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Color(0xFF607D8B),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
              ),
              child: const Row(
                children: [
                  Icon(Icons.description, color: Colors.white, size: 20),
                  SizedBox(width: 8),
                  Text(
                    'Document/Form',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(message.text, style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        message.time,
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                      if (message.isMe)
                        Icon(
                          message.isRead ? Icons.done_all : Icons.done,
                          size: 16,
                          color: message.isRead ? Colors.blue : Colors.grey,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Message _convertToStandardMessage(MessageData messageData) {
    return Message(
      text: messageData.text,
      isMe: messageData.isMe,
      time: messageData.time,
      isRead: messageData.isRead,
    );
  }
}
