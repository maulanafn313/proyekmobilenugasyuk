import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'signin.dart';
import 'create_schedule.dart';
import 'view_schedule.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  /// Build the dashboard page UI.
  ///
  /// This page displays the user's daily quote, status cards, and a create
  /// schedule card.
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF0A4D8C),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
          color: Color(0xFFB3E0FB),
          shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(8),
              child: Icon(Icons.add, color: Color(0xFF0A4D8C)),
            ),
            label: 'Add Schedule',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: 'Notification',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              // Navigate to Home Page
              Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DashboardPage()),
              );
              break;
            case 1:
              // Navigate to Calendar Page
          //     Navigator.push(
          // context,
          // MaterialPageRoute(builder: (context) => CalendarPage()),
          //     );
              break;
            case 2:
              // Navigate to Add Schedule Page
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreateSchedulePage()),
              );
              break;
            case 3:
              // Navigate to History Page
          //     Navigator.push(
          // context,
          // MaterialPageRoute(builder: (context) => HistoryPage()),
          //     );
              break;
            case 4:
              // Navigate to Notification Page
          //     Navigator.push(
          // context,
          // MaterialPageRoute(builder: (context) => NotificationPage()),
          //     );
          //     break;
          }
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Rafif Radhitya',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0A2472),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.logout),
                        onPressed: () async {
                          await AuthService.signOut();
                          Navigator.pushAndRemoveUntil(
                            // ignore: use_build_context_synchronously
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignInPage(),
                            ),
                            (route) => false,
                          );
                        },
                      ),
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: Color(0xFFB3E0FB),
                        child: CircleAvatar(
                          radius: 24,
                          backgroundImage: AssetImage('images/avatar.png'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Daily Quote Card
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Color(0xFFB3E0FB),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(2, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Daily Quote',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0xFF0A2472),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '“I am not a product of my circumstances. I am a product of my decisions.” -',
                      style: TextStyle(fontSize: 16, color: Color(0xFF0A2472)),
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: List.generate(
                        5,
                        (index) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 2),
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color:
                                index == 0
                                    ? Color(0xFF0A2472)
                                    // ignore: deprecated_member_use
                                    : Colors.white.withOpacity(0.6),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Status Cards
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _StatusCard(
                    icon: Icons.assignment_outlined,
                    color: Colors.blue,
                    borderColor: Colors.blue,
                    label: 'Todo',
                  ),
                  _StatusCard(
                    icon: Icons.view_column_outlined,
                    color: Colors.yellow[700]!,
                    borderColor: Colors.yellow[700]!,
                    label: 'Progress',
                  ),
                  _StatusCard(
                    icon: Icons.check_box_outlined,
                    color: Colors.green,
                    borderColor: Colors.green,
                    label: 'Done',
                  ),
                  _StatusCard(
                    icon: Icons.warning_amber_rounded,
                    color: Colors.red,
                    borderColor: Colors.red,
                    label: 'Late',
                  ),
                ],
              ),
              SizedBox(height: 24),
              // Create Schedule Card
              _BigCard(
                text:
                    "Hi! I know it can be tough to stay organized. Let's make a schedule together!",
                buttonText: "Create Schedule",
                imageAsset: 'images/notelist.png',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateSchedulePage(),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              // View Schedule Card
              _BigCard(
                text: "Check your progress and stay on top of your tasks!",
                buttonText: "View Schedule",
                imageAsset: 'images/presentation.png',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ViewSchedulePage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color borderColor;
  final String label;

  const _StatusCard({
    required this.icon,
    required this.color,
    required this.borderColor,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: borderColor, width: 2),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(2, 4)),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 32),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: Color(0xFF0A2472),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _BigCard extends StatelessWidget {
  final String text;
  final String buttonText;
  final String imageAsset;
  final VoidCallback onPressed;

  const _BigCard({
    required this.text,
    required this.buttonText,
    required this.imageAsset,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Color(0xFFB3E0FB),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(2, 4)),
        ],
      ),
      child: Row(
        children: [
          // Text and button
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    color: Color(0xFF0A2472),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4DB6F7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  onPressed: onPressed,
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 8),
          // Illustration
          Expanded(
            flex: 1,
            child: Image.asset(imageAsset, height: 80, fit: BoxFit.contain),
          ),
        ],
      ),
    );
  }
}
