import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Color(0xFF0A2472),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF0A2472)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListView(
          children: [
            const SectionTitle(title: 'New'),
            NotificationItem(
              avatarColor: Colors.red[100]!,
              avatarText: 'IP',
              name: 'Indah Putri',
              action: 'updated the task',
              taskName: 'Mobile App Design Project',
              time: '31 min',
            ),
            NotificationItem(
              avatarColor: Colors.green[100]!,
              avatarText: 'M',
              name: 'Maulana',
              action: 'updated the task',
              taskName: 'Mobile App Design Project',
              time: '31 min',
            ),
            NotificationItem(
              avatarColor: Colors.pink[100]!,
              avatarText: 'G',
              name: 'Ghina',
              action: 'completed the task',
              taskName: 'Mobile App Design Project',
              time: '31 min',
            ),
            NotificationItem(
              avatarColor: Colors.blue[100]!,
              avatarText: 'R',
              name: 'Rafif',
              action: 'added a task',
              taskName: 'Mobile App Design Project',
              time: '31 min',
            ),
            const SizedBox(height: 16),
            const SectionTitle(title: 'Earlier'),
            NotificationItem(
              avatarColor: Colors.green[100]!,
              avatarText: 'M',
              name: 'Maulana',
              action: 'set the task',
              taskName: 'Mobile App Design Project to in progress',
              time: '4 hours',
            ),
            NotificationItem(
              avatarColor: Colors.pink[100]!,
              avatarText: 'G',
              name: 'Ghina',
              action: 'added the task',
              taskName: 'Mobile App Design Project',
              time: '31 min',
            ),
            NotificationItem(
              avatarColor: Colors.blue[100]!,
              avatarText: 'R',
              name: 'Rafif',
              action: 'completed the task',
              taskName: 'Mobile App Design Project',
              time: '31 min',
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFF0A2472),
        ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final Color avatarColor;
  final String avatarText;
  final String name;
  final String action;
  final String taskName;
  final String time;

  const NotificationItem({
    required this.avatarColor,
    required this.avatarText,
    required this.name,
    required this.action,
    required this.taskName,
    required this.time,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: avatarColor,
            child: Text(
              avatarText,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: '$name ',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: '$action '),
                      TextSpan(
                        text: taskName,
                        style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}