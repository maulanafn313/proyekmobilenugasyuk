import 'package:flutter/material.dart';

class DetailSchedulePage extends StatelessWidget {
  final String title;
  final String description;
  final String startDate;
  final String dueDate;
  final String reminder;
  final String status;
  final String category;
  final String priority;
  final String url;
  final List<Map<String, String>> projectTeam;

  const DetailSchedulePage({
    super.key,
    required this.title,
    required this.description,
    required this.startDate,
    required this.dueDate,
    required this.reminder,
    required this.status,
    required this.category,
    required this.priority,
    required this.url,
    required this.projectTeam,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Task Details',
          style: TextStyle(
            color: Color(0xFF0A2472),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF0A2472)),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Color(0xFF0A2472)),
            onPressed: () {
              // Add edit functionality here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0A2472),
              ),
            ),
            const SizedBox(height: 16),

            // Description Box
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F6FB),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF0A2472),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Details Section
            _DetailRow(label: 'Start Date', value: startDate),
            _DetailRow(label: 'Reminder', value: reminder),
            _DetailRow(label: 'Due Date', value: dueDate),
            _DetailRow(label: 'Status', value: status),
            _DetailRow(label: 'Category', value: category),
            _DetailRow(label: 'Priority', value: priority),
            const SizedBox(height: 24),

            // URL Section
            const Text(
              'URL',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0A2472),
              ),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                // Add URL navigation functionality here
              },
              child: Text(
                url,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Project Team Section
            const Text(
              'Project Team',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0A2472),
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: projectTeam
                  .map((member) => Chip(
                        label: Text(
                          member['name']!,
                          style: const TextStyle(color: Colors.white),
                        ),
                        avatar: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Text(
                            member['avatar']!,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                        backgroundColor: const Color(0xFF0A2472),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 32),

            // Done Task Button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                ),
                onPressed: () {
                  // Add "Done Task" functionality here
                },
                child: const Text(
                  'Done Task',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A2472),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF0A2472),
            ),
          ),
        ],
      ),
    );
  }
}