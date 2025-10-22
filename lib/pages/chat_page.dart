// pages/chat_page.dart
import 'package:flutter/material.dart';
import '../models/chat_models.dart';
import '../models/message_types.dart';
import '../widgets/bubble_factory.dart';
import '../widgets/beautiful_avatar.dart';

class ChatPage extends StatefulWidget {
  final Chat chat;

  const ChatPage({super.key, required this.chat});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  MessageData _convertToMessageData(Message message) {
    MessageType type = MessageType.standard;
    Map<String, dynamic>? metadata;

    // Determine message type based on chat name and content
    switch (widget.chat.name) {
      case 'Homework':
        type = MessageType.homework;
        metadata = {
          'subject': 'Mathematics',
          'dueDate': 'Tomorrow by 8:00 AM',
          'chapter': 'Chapter 5',
        };
        break;
      case 'School Fee':
        type = MessageType.fee;
        metadata = {
          'amount': '₹2,500',
          'dueDate': '3 days',
          'type': 'Monthly Fee',
          'status': 'Pending',
        };
        break;
      case 'Exam Results':
        type = MessageType.results;
        metadata = {
          'exam': 'Mid-term',
          'grade': 'A+',
          'percentage': '95%',
          'rank': '1st',
        };
        break;
      case 'Principal Notice':
        type = MessageType.notice;
        break;
      case 'Gate pass':
        type = MessageType.form;
        break;
      default:
        type = MessageType.standard;
    }

    return MessageData(
      text: message.text,
      isMe: message.isMe,
      time: message.time,
      isRead: message.isRead,
      type: type,
      metadata: metadata,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECE5DD),
      appBar: AppBar(
        backgroundColor: const Color(0xFF8E24AA),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF8E24AA),
                Color(0xFF9C27B0),
              ],
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            BeautifulAvatar(
              category: widget.chat.name,
              size: 36,
              isOnline: widget.chat.isOnline,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.chat.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    widget.chat.isOnline ? 'Online' : 'Last seen recently',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark, color: Colors.white),
            onPressed: () {},
            tooltip: 'Bookmark notification',
          ),
          IconButton(
            icon: const Icon(Icons.share, color: Colors.white),
            onPressed: () {},
            tooltip: 'Share notification',
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onSelected: (value) {},
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: 'mark_read',
                child: Text('Mark as read'),
              ),
              const PopupMenuItem<String>(
                value: 'archive',
                child: Text('Archive'),
              ),
              const PopupMenuItem<String>(
                value: 'search',
                child: Text('Search messages'),
              ),
              const PopupMenuItem<String>(
                value: 'mute',
                child: Text('Mute notifications'),
              ),
              const PopupMenuItem<String>(
                value: 'delete',
                child: Text('Delete'),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // Messages list
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: widget.chat.messages.length,
              itemBuilder: (context, index) {
                final message = widget.chat.messages[index];
                // Convert Message to MessageData with appropriate type
                final messageData = _convertToMessageData(message);
                return BubbleFactory.createBubble(messageData);
              },
            ),
          ),
          // Reply input
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.reply, color: Colors.grey),
                  onPressed: () {},
                  tooltip: 'Reply to notification',
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: TextField(
                      controller: _messageController,
                      decoration: const InputDecoration(
                        hintText: 'Reply to this notification...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.attach_file, color: Colors.grey),
                  onPressed: () {},
                  tooltip: 'Attach file',
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Color(0xFF25D366)),
                  onPressed: () {
                    if (_messageController.text.isNotEmpty) {
                      // Add reply logic here
                      _messageController.clear();
                    }
                  },
                  tooltip: 'Send reply',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
