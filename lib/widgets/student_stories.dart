// widgets/student_stories.dart
import 'package:flutter/material.dart';

class StudentStory {
  final String name;
  final String avatar;
  final bool hasNewStory;
  final bool isOwnStory;

  StudentStory({
    required this.name,
    required this.avatar,
    this.hasNewStory = false,
    this.isOwnStory = false,
  });
}

class StudentStories extends StatelessWidget {
  const StudentStories({super.key});

  static List<StudentStory> getStudentStories() {
    return [
      StudentStory(
        name: 'You',
        avatar: '👤',
        hasNewStory: false,
        isOwnStory: true,
      ),
      StudentStory(
        name: 'Sarah',
        avatar: '👩',
        hasNewStory: true,
      ),
      StudentStory(
        name: 'Ahmed',
        avatar: '👨',
        hasNewStory: true,
      ),
      StudentStory(
        name: 'Fatima',
        avatar: '👧',
        hasNewStory: true,
      ),
      StudentStory(
        name: 'Ali',
        avatar: '👦',
        hasNewStory: false,
      ),
      StudentStory(
        name: 'Aisha',
        avatar: '👩‍🎓',
        hasNewStory: true,
      ),
      StudentStory(
        name: 'Omar',
        avatar: '👨‍🎓',
        hasNewStory: false,
      ),
      StudentStory(
        name: 'Zainab',
        avatar: '👩‍💼',
        hasNewStory: true,
      ),
      StudentStory(
        name: 'Hassan',
        avatar: '👨‍💼',
        hasNewStory: false,
      ),
      StudentStory(
        name: 'Maryam',
        avatar: '👩‍🔬',
        hasNewStory: true,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final stories = getStudentStories();

    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: stories.length,
        itemBuilder: (context, index) {
          final story = stories[index];
          return _buildStoryItem(story);
        },
      ),
    );
  }

  Widget _buildStoryItem(StudentStory story) {
    return Container(
      width: 70,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          // Story Circle
          GestureDetector(
            onTap: () {
              // Handle story tap
            },
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: story.hasNewStory
                    ? const LinearGradient(
                        colors: [
                          Color(0xFF3498DB),
                          Color(0xFFE74C3C),
                          Color(0xFFF39C12),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : null,
                color: story.hasNewStory ? null : Colors.grey[300],
                border: story.isOwnStory
                    ? Border.all(color: Colors.grey[400]!, width: 2)
                    : null,
              ),
              child: Container(
                margin: story.hasNewStory ? const EdgeInsets.all(3) : EdgeInsets.zero,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Container(
                  margin: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: story.isOwnStory
                        ? const LinearGradient(
                            colors: [Color(0xFFF8F9FA), Color(0xFFE9ECEF)],
                          )
                        : _getStudentGradient(story.name),
                  ),
                  child: Center(
                    child: Text(
                      story.avatar,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          // Student Name
          Text(
            story.name,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: Color(0xFF2C3E50),
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  LinearGradient _getStudentGradient(String name) {
    // Generate consistent gradients based on name
    final colors = [
      [Color(0xFF667eea), Color(0xFF764ba2)],
      [Color(0xFFf093fb), Color(0xFFf5576c)],
      [Color(0xFF4facfe), Color(0xFF00f2fe)],
      [Color(0xFF43e97b), Color(0xFF38f9d7)],
      [Color(0xFFfa709a), Color(0xFFfee140)],
      [Color(0xFFa8edea), Color(0xFFfed6e3)],
      [Color(0xFFffecd2), Color(0xFFfcb69f)],
      [Color(0xFFff9a9e), Color(0xFFfecfef)],
    ];

    final index = name.hashCode.abs() % colors.length;
    return LinearGradient(
      colors: colors[index],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }
}
