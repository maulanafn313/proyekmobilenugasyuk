import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user/schedule_provider.dart';
import 'signin.dart';
import 'auth_service.dart';
import 'user/dashboardpage.dart';
import 'landing_page.dart';

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