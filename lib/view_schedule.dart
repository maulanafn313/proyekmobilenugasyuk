// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'create_schedule.dart';
import 'detail_schedule.dart';

class ViewSchedulePage extends StatefulWidget {
  const ViewSchedulePage({super.key});

  @override
  _ViewSchedulePageState createState() => _ViewSchedulePageState();
}

class _ViewSchedulePageState extends State<ViewSchedulePage> {
  final List<Map<String, dynamic>> _schedules = [];

  void _addSchedule(Map<String, dynamic> schedule) {
    setState(() {
      _schedules.add(schedule);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'View Schedule',
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
        child: ListView.builder(
          itemCount: _schedules.length,
          itemBuilder: (context, index) {
            final schedule = _schedules[index];
            return _ScheduleCard(
              title: schedule['title'],
              deadline: schedule['dueDate'],
              onDetailsPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => DetailSchedulePage(
                          title: schedule['title'],
                          description: schedule['description'],
                          startDate: schedule['startDate'],
                          dueDate: schedule['dueDate'],
                          reminder: schedule['reminder'],
                          status: schedule['status'],
                          category: schedule['category'],
                          priority: schedule['priority'],
                          url: schedule['url'],
                          projectTeam: schedule['projectTeam'],
                        ),
                  ),
                );
              },
              onEditPressed: () {},
              onDeletePressed: () {
                setState(() {
                  _schedules.removeAt(index);
                });
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newSchedule = await Navigator.push<Map<String, dynamic>>(
            context,
            MaterialPageRoute(builder: (context) => const CreateSchedulePage()),
          );
          if (newSchedule != null) {
            _addSchedule(newSchedule);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _ScheduleCard extends StatelessWidget {
  final String title;
  final String deadline;
  final VoidCallback onDetailsPressed;
  final VoidCallback onEditPressed;
  final VoidCallback onDeletePressed;

  const _ScheduleCard({
    required this.title,
    required this.deadline,
    required this.onDetailsPressed,
    required this.onEditPressed,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFB3E0FB),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0A2472),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Deadline: $deadline',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF0A2472),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              IconButton(
                icon: const Icon(Icons.edit, color: Color(0xFF0A2472)),
                onPressed: onEditPressed,
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Color(0xFF0A2472)),
                onPressed: onDeletePressed,
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0A2472),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: onDetailsPressed,
            child: const Text('Details', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
