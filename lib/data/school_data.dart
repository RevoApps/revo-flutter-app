// data/school_data.dart
import '../models/chat_models.dart';

class SchoolData {
  static List<Chat> getSchoolChats() {
    return [
      Chat(
        name: 'Homework',
        lastMessage: 'Get daily Homework',
        time: '2:30 PM',
        avatar: '📚',
        unreadCount: 3,
        isOnline: true,
        messages: [
          Message(text: 'New homework assigned for Mathematics', isMe: false, time: '2:25 PM'),
          Message(text: 'Please complete Chapter 5 exercises 1-20', isMe: false, time: '2:27 PM'),
          Message(text: 'Due date: Tomorrow by 8:00 AM', isMe: false, time: '2:30 PM'),
        ],
      ),
      Chat(
        name: 'Principal Notice',
        lastMessage: 'Mr Arvind Sharma ',
        time: '1:45 PM',
        avatar: '📢',
        unreadCount: 1,
        isOnline: true,
        messages: [
          Message(text: 'Important announcement for all students', isMe: false, time: '1:40 PM'),
          Message(text: 'School assembly tomorrow at 8:30 AM', isMe: false, time: '1:45 PM'),
        ],
      ),
      Chat(
        name: 'School Fee',
        lastMessage: 'full details of school fee',
        time: '11:20 AM',
        avatar: '💰',
        unreadCount: 2,
        isOnline: false,
        messages: [
          Message(text: 'Monthly school fee reminder', isMe: false, time: '11:15 AM'),
          Message(text: 'Amount: ₹2,500 - Due: 3 days', isMe: false, time: '11:20 AM'),
        ],
      ),
      Chat(
        name: 'Exam Results',
        lastMessage: 'Check your exam results',
        time: 'Yesterday',
        avatar: '📊',
        unreadCount: 0,
        isOnline: true,
        messages: [
          Message(text: 'Mid-term examination results are now available', isMe: false, time: 'Yesterday 4:00 PM'),
          Message(text: 'Please check your grades on the portal', isMe: false, time: 'Yesterday 4:05 PM'),
          Message(text: 'Congratulations on your performance!', isMe: false, time: 'Yesterday 4:10 PM'),
        ],
      ),
      Chat(
        name: 'Class Tests',
        lastMessage: 'Get your class tests',
        time: 'Yesterday',
        avatar: '🚌',
        unreadCount: 0,
        isOnline: false,
        messages: [
          Message(text: 'Transport update for Route 3', isMe: false, time: 'Yesterday 3:30 PM'),
          Message(text: 'Bus will be delayed by 15 minutes due to traffic', isMe: false, time: 'Yesterday 3:35 PM'),
        ],
      ),
      Chat(
        name: 'Gate pass',
        lastMessage: 'Medical checkup scheduled for next week',
        time: '2 days ago',
        avatar: '🏥',
        unreadCount: 0,
        isOnline: false,
        messages: [
          Message(text: 'Annual medical checkup notification', isMe: false, time: '2 days ago 10:00 AM'),
          Message(text: 'Scheduled for next week - Please bring medical forms', isMe: false, time: '2 days ago 10:05 AM'),
        ],
      ),
      Chat(
        name: 'Personal Message',
        lastMessage: 'Get your personal message',
        time: '3 days ago',
        avatar: '🎓',
        unreadCount: 0,
        isOnline: true,
        messages: [
          Message(text: 'Library update: New books have arrived', isMe: false, time: '3 days ago 2:00 PM'),
          Message(text: 'Visit the library to explore new collection', isMe: false, time: '3 days ago 2:05 PM'),
        ],
      ),
      Chat(
        name: 'PTM Notification',
        lastMessage: 'Get your PTM notification',
        time: '1 week ago',
        avatar: '🎨',
        unreadCount: 0,
        isOnline: false,
        messages: [
          Message(text: 'Annual Sports Day announcement', isMe: false, time: '1 week ago 9:00 AM'),
          Message(text: 'Registration is now open - Sign up at sports office', isMe: false, time: '1 week ago 9:05 AM'),
        ],
      ),
    ];
  }

  static List<Chat> getSortedChats() {
    final chats = getSchoolChats();
    chats.sort((a, b) => a.name.compareTo(b.name));
    return chats;
  }
}
