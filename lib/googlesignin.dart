import 'package:flutter/material.dart';
import 'signin.dart';

class GoogleSignInPage extends StatelessWidget {
  const GoogleSignInPage({super.key});

  @override
/// Builds a Google sign-in page with a back button, a card for choosing 
/// or adding a Google account, and privacy information.
///
/// The page includes:
/// - A back button that navigates to the sign-in page.
/// - A card displaying a "Sign in with Google" header, a list of accounts to 
///   choose from, and an option to use another account.
/// - Privacy information explaining what data Google will share with the app.
/// - A footer with language and links to help, privacy, and terms.

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Back button and Logo section
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  // Back Button
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInPage(),
                          ),
                        );
                      },
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            size: 20,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Google Sign In Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[300]!),
                  boxShadow: [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 0,
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Sign in with Google header
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey[300]!),
                        ),
                      ),
                      child: Row(
                        children: [
                          Image.asset('images/google.png', height: 24),
                          const SizedBox(width: 12),
                          const Text(
                            'Sign in with Google',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Choose account section
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          // Logo Nugas Yuk
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color:
                                  Colors
                                      .blue[50], // Mengubah warna background menjadi biru muda
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'images/logo nugasyuk.png',
                              height: 40, // Sesuaikan ukuran logo
                              width: 40,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Choose an account',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          RichText(
                            text: TextSpan(
                              text: 'to continue to ',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Nugasyuk',
                                  style: TextStyle(
                                    color: Colors.blue[600],
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Account list
                    _buildAccountItem('A', 'Account Name', 'email@gmail.com'),
                    _buildAccountItem('A', 'Account Name', 'email@gmail.com'),

                    // Use another account button
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey[300]!),
                        ),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          child: const Icon(
                            Icons.person_add,
                            color: Colors.black87,
                          ),
                        ),
                        title: const Text(
                          'Use another account',
                          style: TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                        onTap: () {
                          // Handle use another account
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            // Privacy text
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                'To continue, Google will share your name, email address, language preference, and profile picture with Company. Before using this app, you can review Company\'s privacy policy and terms of service.',
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),

            // Footer
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'English (United States)',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  Text('Help', style: TextStyle(color: Colors.grey[600])),
                  Text('Privacy', style: TextStyle(color: Colors.grey[600])),
                  Text('Terms', style: TextStyle(color: Colors.grey[600])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountItem(String initial, String name, String email) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey[300]!)),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.deepPurple,
          child: Text(initial, style: const TextStyle(color: Colors.white)),
        ),
        title: Text(
          name,
          style: const TextStyle(fontSize: 16, color: Colors.black87),
        ),
        subtitle: Text(
          email,
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
        ),
        onTap: () {
          // Handle account selection
        },
      ),
    );
  }
}
