// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
                style: const TextStyle(fontSize: 14, color: Color(0xFF0A2472)),
              ),
            ),
            const SizedBox(height: 24),

            // Details Section
            _DetailRow(label: 'Start Date', value: startDate),
            _DetailRow(label: 'Reminder', value: reminder),
            _DetailRow(label: 'Due Date', value: dueDate),
            _DetailRow(
              label: 'Status',
              value: status,
              valueStyle: TextStyle(
                fontSize: 14,
                color:
                    status == 'Done'
                        ? Colors.green
                        : status == 'In Progress'
                        ? Colors.orange
                        : Colors.red,
              ),
            ),
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
              onTap: () async {
                final uri = Uri.parse(url);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Could not open URL')),
                  );
                }
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
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Task marked as done!'),
                      backgroundColor: Colors.green,
                    ),
                  );  
                Navigator.pop(context); // Close the detail page
                },
                child: const Text(
                  'Done Task',
                  style: TextStyle(fontSize: 16, color: Colors.white),
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
  final TextStyle? valueStyle;

  const _DetailRow({required this.label, required this.value, this.valueStyle});

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
            style:
                valueStyle ??
                const TextStyle(fontSize: 14, color: Color(0xFF0A2472)),
          ),
        ],
      ),
    );
  }
}
