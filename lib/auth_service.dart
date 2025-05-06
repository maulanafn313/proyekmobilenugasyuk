import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String _keyEmail = 'user_email';
  static const String _keyPassword = 'user_password';

  // Simpan user baru
  static Future<bool> signUp(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    // Cek jika email sudah terdaftar
    if (prefs.getString(_keyEmail) == email) return false;
    await prefs.setString(_keyEmail, email);
    await prefs.setString(_keyPassword, password);
    return true;
  }

  // Login user
  static Future<bool> signIn(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString(_keyEmail);
    final savedPassword = prefs.getString(_keyPassword);
    return (email == savedEmail && password == savedPassword);
  }

  // Cek status login
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyEmail) != null;
  }

  // Logout
  static Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyEmail);
    await prefs.remove(_keyPassword);
  }
}
