// pages/home_page.dart
import 'package:flutter/material.dart';
import '../models/chat_models.dart';
import '../widgets/chat_list_item.dart';
import '../pages/chat_page.dart';
import '../data/school_data.dart';
import '../widgets/student_stories.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSorted = false;
  late List<Chat> chats;

  @override
  void initState() {
    super.initState();
    chats = SchoolData.getSchoolChats();
  }

  void sortChats() {
    setState(() {
      if (isSorted) {
        chats = SchoolData.getSchoolChats();
        isSorted = false;
      } else {
        chats = SchoolData.getSortedChats();
        isSorted = true;
      }
    });
  }

  void navigateToChat(Chat chat) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatPage(chat: chat),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Column(
        children: [
          // Header section
          Container(
            padding: const EdgeInsets.fromLTRB(16, 40, 16, 12),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // School Logo
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          '🏫',
                          style: TextStyle(fontSize: 28),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ahmed Ali',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Class: 10A | Roll No: 12345',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        icon: Icon(
                          isSorted ? Icons.sort_by_alpha : Icons.sort,
                          color: Colors.white,
                        ),
                        onPressed: sortChats,
                        tooltip: isSorted ? 'Reset order' : 'Sort alphabetically',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
              // Dashboard section
              Container(
                height: 100,
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
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        // Left Column - School Logo
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              '🏫',
                              style: TextStyle(fontSize: 26),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        // Right Column - School Information
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // School Name
                              const Text(
                                'Pathways Global School',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2C3E50),
                                ),
                              ),
                              const SizedBox(height: 2),
                              // School Address
                              const Text(
                                'Kot ise khan',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF3498DB),
                                ),
                              ),
                              const SizedBox(height: 2),
                              // Session Info
                              const Text(
                                'Session 2025-26',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF7F8C8D),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          // Student Stories Section
          Container(
            color: Colors.white,
            child: const StudentStories(),
          ),
          // Chats list
          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                final chat = chats[index];
                return ChatListItem(
                  chat: chat,
                  onTap: () => navigateToChat(chat),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
