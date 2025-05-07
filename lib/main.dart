import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'schedule_provider.dart';
import 'signin.dart';
import 'auth_service.dart';
import 'dashboardpage.dart';

/// The main entry point of the app.
///
/// This function first ensures that the Flutter widgets binding is initialized.
/// Then, it checks if the user is logged in by calling [AuthService.isLoggedIn].
/// If the user is logged in, it runs the app with the [MainApp] widget and
/// starts at the dashboard page. Otherwise, it starts at the landing page.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final loggedIn = await AuthService.isLoggedIn();
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ScheduleProvider())],
      child: MainApp(startAtDashboard: loggedIn),
    ),
  );
}

class MainApp extends StatelessWidget {
  final bool startAtDashboard;
  const MainApp({super.key, required this.startAtDashboard});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF1E3A8A), // Navy blue color
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1E3A8A)),
      ),
      home: startAtDashboard ? DashboardPage() : LandingPage(),
      routes: {'/signin': (context) => const SignInPage()},
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Logo section
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/logo nugasyuk.png', height: 60),
                    const SizedBox(width: 8),
                  ],
                ),
              ),

              // Character illustration
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'images/animasi mahasiswa.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              // Text content
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Manage\nyour\nSchedule\nwith\nNugasYUK!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                        color: Colors.lightBlue[100],
                      ),
                    ),
                  ],
                ),
              ),

              // Let's Start button
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Add navigation logic here
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignInPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    minimumSize: const Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    "Let's Start",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
