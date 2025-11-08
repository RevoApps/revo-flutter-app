import 'package:flutter/material.dart';
import 'package:pipe_x/pipe_x.dart';
import 'package:revo_schools/application/notice/notice_hub.dart';
import 'package:revo_schools/core/models/notice_model.dart';

class NoticePage extends StatefulWidget {
  const NoticePage({super.key});

  @override
  State<NoticePage> createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  String _selectedLanguage = 'english'; // 'english' or 'punjabi'

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
      return '${months[date.month - 1]} ${date.day.toString().padLeft(2, '0')}, ${date.year}';
    } catch (e) {
      return dateString;
    }
  }

  String _getTimeAgo(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      final now = DateTime.now();
      final difference = now.difference(date);

      if (difference.inDays > 365) {
        return '${(difference.inDays / 365).floor()} year${(difference.inDays / 365).floor() > 1 ? 's' : ''} ago';
      } else if (difference.inDays > 30) {
        return '${(difference.inDays / 30).floor()} month${(difference.inDays / 30).floor() > 1 ? 's' : ''} ago';
      } else if (difference.inDays > 0) {
        return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
      } else if (difference.inHours > 0) {
        return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
      } else if (difference.inMinutes > 0) {
        return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
      } else {
        return 'Just now';
      }
    } catch (e) {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final hub = HubProvider.of<NoticeHub>(context);
    final sortedNotices = _getSortedNotices(hub.notices);

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
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  '📢',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Principal Notice',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'School Announcements',
                    style: TextStyle(
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
            icon: const Icon(Icons.language, color: Colors.white),
            onPressed: () {
              setState(() {
                _selectedLanguage = _selectedLanguage == 'english' ? 'punjabi' : 'english';
              });
            },
            tooltip: 'Switch Language',
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onSelected: (value) {
              if (value == 'filter') {
                _showFilterDialog();
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: 'filter',
                child: Row(
                  children: [
                    Icon(Icons.filter_list, size: 20),
                    SizedBox(width: 8),
                    Text('Filter Notices'),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'search',
                child: Row(
                  children: [
                    Icon(Icons.search, size: 20),
                    SizedBox(width: 8),
                    Text('Search Notices'),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'archive',
                child: Row(
                  children: [
                    Icon(Icons.archive, size: 20),
                    SizedBox(width: 8),
                    Text('Archived Notices'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // Language Toggle Banner
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Icon(
                  _selectedLanguage == 'english' ? Icons.language : Icons.translate,
                  size: 16,
                  color: const Color(0xFF8E24AA),
                ),
                const SizedBox(width: 8),
                Text(
                  'Showing notices in ${_selectedLanguage == 'english' ? 'English' : 'ਪੰਜਾਬੀ'}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF8E24AA),
                  ),
                ),
                const Spacer(),
                Text(
                  '${sortedNotices.length} Notice${sortedNotices.length != 1 ? 's' : ''}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          // Notices List
          Expanded(
            child: sortedNotices.isEmpty
                ? _buildEmptyState()
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: sortedNotices.length,
                    itemBuilder: (context, index) {
                      final notice = sortedNotices[index];
                      return _buildNoticeCard(notice);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(60),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: const Center(
              child: Text(
                '📭',
                style: TextStyle(fontSize: 60),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'No Notices Available',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Check back later for updates',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoticeCard(Notice notice) {
    final noticeText = _selectedLanguage == 'english' ? notice.englishNotice : notice.punjabiNotice;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date at the top
            Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 14,
                  color: Colors.grey[600],
                ),
                const SizedBox(width: 6),
                Text(
                  _formatDate(notice.createdAt),
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Text(
                  _getTimeAgo(notice.createdAt),
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Notice body content
            Text(
              noticeText,
              style: const TextStyle(
                fontSize: 15,
                height: 1.5,
                color: Color(0xFF2C3E50),
              ),
            ),
            if (notice.noticeRemarks != null) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.amber.withOpacity(0.3),
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.info_outline,
                      color: Colors.amber,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        notice.noticeRemarks!,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF2C3E50),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            if (notice.noticeAttachment != null) ...[
              const SizedBox(height: 12),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.attachment, size: 16),
                label: const Text('View Attachment'),
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF8E24AA),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  List<Notice> _getSortedNotices(List<Notice> notices) {
    final sortedList = List<Notice>.from(notices);
    sortedList.sort((a, b) {
      try {
        final dateA = DateTime.parse(a.createdAt);
        final dateB = DateTime.parse(b.createdAt);
        return dateB.compareTo(dateA); // Most recent first
      } catch (e) {
        return 0;
      }
    });
    return sortedList;
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Filter Notices'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.all_inclusive),
                title: const Text('All Notices'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.pending, color: Colors.orange),
                title: const Text('Pending'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.check_circle, color: Colors.green),
                title: const Text('Active'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.cancel, color: Colors.red),
                title: const Text('Expired'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
