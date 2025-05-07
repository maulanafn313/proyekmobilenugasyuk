// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

class CreateSchedulePage extends StatefulWidget {
  const CreateSchedulePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CreateSchedulePageState createState() => _CreateSchedulePageState();
}

class _CreateSchedulePageState extends State<CreateSchedulePage> {
  String? taskType;
  String? importance;
  DateTime? startDate;
  DateTime? endDate;
  DateTime? reminderDate;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController urlController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleController.text = "Title Schedule";
    urlController.text = "https://www.nugasyuk.id";
    descriptionController.text = "Description Schedule";
  }

  Future<void> pickDateTime(BuildContext context, String type) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (date == null) return;
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time == null) return;
    final dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    setState(() {
      if (type == 'start') {
        startDate = dateTime;
      } else if (type == 'end') {
        endDate = dateTime;
      } else if (type == 'reminder') {
        reminderDate = dateTime;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text(
          'Create Schedule',
          style: TextStyle(color: Color(0xFF23238E)),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Basic Information',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Color(0xFF23238E),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Schedule Title',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 4),
            _buildTextField(
              titleController,
              'Title Schedule',
              Icons.access_time,
            ),
            SizedBox(height: 12),
            Text(
              'Schedule Category',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 4),
            _buildDropdown(
              value: taskType,
              hint: 'Schedule Category',
              items: ['Schedule Category', 'Task', 'Meeting', 'Activities'],
              icon: Icons.access_time,
              onChanged: (val) => setState(() => taskType = val),
            ),
            SizedBox(height: 12),
            Text('Priority', style: TextStyle(fontWeight: FontWeight.w600)),
            SizedBox(height: 4),
            _buildDropdown(
              value: importance,
              hint: 'Very Important',
              items: ['Very Important', 'Important', 'Normal'],
              icon: Icons.check_box,
              onChanged: (val) => setState(() => importance = val),
            ),
            SizedBox(height: 28),
            Text(
              'Schedule Dates',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Color(0xFF23238E),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Start Date & Time',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 4),
            _buildDateButton(
              context,
              startDate,
              '01/05/2025 14:30',
              () => pickDateTime(context, 'start'),
            ),
            SizedBox(height: 12),
            Text(
              'End Date & Time',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 4),
            _buildDateButton(
              context,
              endDate,
              '01/05/2025 - 23:59',
              () => pickDateTime(context, 'end'),
            ),
            SizedBox(height: 12),
            Text(
              'Reminder End Date & Time',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 4),
            _buildDateButton(
              context,
              reminderDate,
              '01/05/2025 - 22:59',
              () => pickDateTime(context, 'reminder'),
            ),
            SizedBox(height: 28),
            Text(
              'Additional Information',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Color(0xFF23238E),
              ),
            ),
            SizedBox(height: 16),
            Text('URL', style: TextStyle(fontWeight: FontWeight.w600)),
            SizedBox(height: 4),
            _buildTextField(
              urlController,
              'https://www.nugasyuk.id',
              Icons.language,
            ),
            SizedBox(height: 12),
            Text('Description', style: TextStyle(fontWeight: FontWeight.w600)),
            SizedBox(height: 4),
            _buildTextField(
              descriptionController,
              'Description',
              null,
              maxLines: 3,
            ),
            SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4CB6E6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  minimumSize: const Size(double.infinity, 56),
                ),
                onPressed: () {
                  if (startDate != null && endDate != null) {
                    final newSchedule = {
                      'title': titleController.text,
                      'description': descriptionController.text,
                      'startDate': "${startDate!.toLocal()}".split(' ')[0],
                      'dueDate': "${endDate!.toLocal()}".split(' ')[0],
                      'reminder': "${reminderDate?.toLocal()}".split(' ')[0],
                      'status': 'Todo',
                      'category': taskType ?? 'Task',
                      'priority': importance ?? 'Normal',
                      'url': urlController.text,
                    };
                    Navigator.pop(context, newSchedule);
                  }
                },
                child: const Text(
                  'Create Schedule',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String hint,
    IconData? icon, {
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        prefixIcon: icon != null ? Icon(icon, color: Color(0xFF4CB6E6)) : null,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(color: Color(0xFFBFE6F8)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(color: Color(0xFFBFE6F8)),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      ),
    );
  }

  Widget _buildDropdown({
    required String? value,
    required String hint,
    required List<String> items,
    IconData? icon,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        prefixIcon: icon != null ? Icon(icon, color: Color(0xFF4CB6E6)) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(color: Color(0xFFBFE6F8)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(color: Color(0xFFBFE6F8)),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      ),
      hint: Text(hint),
      items:
          items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
      onChanged: onChanged,
    );
  }

  Widget _buildDateButton(
    BuildContext context,
    DateTime? date,
    String placeholder,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFBFE6F8)),
          borderRadius: BorderRadius.circular(24),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Icon(Icons.calendar_today, color: Color(0xFF4CB6E6)),
            SizedBox(width: 8),
            Text(
              date != null
                  ? "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}"
                  : placeholder,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
