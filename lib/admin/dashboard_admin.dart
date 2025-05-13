import 'package:flutter/material.dart';
import '../signin.dart';
import '../models/user_model.dart';
import 'edit_user_page.dart';
import 'user_detail_page.dart';

class AdminDashboardPage extends StatefulWidget {
  const AdminDashboardPage({super.key});

  @override
  State<AdminDashboardPage> createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> {
  List<User> _users = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  void _loadUsers() {
    setState(() {
      _isLoading = true;
    });

    // Simulasi loading data
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _users = [
          User(
            id: '1',
            name: 'Agnes Putra',
            email: 'gkurniawan@example.net',
            address: 'Jl. Mawar No. 1',
            city: 'Jakarta',
            province: 'DKI Jakarta',
          ),
          User(
            id: '2',
            name: 'Agus Puspita',
            email: 'xsuryono@example.com',
            address: 'Jl. Melati No. 2',
            city: 'Bandung',
            province: 'Jawa Barat',
          ),
        ];
        _isLoading = false;
      });
    });
  }

  void _addOrUpdateUser(User? user) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditUserPage(user: user)),
    );

    if (result != null && result is User) {
      setState(() {
        if (user == null) {
          _users.add(result);
        } else {
          final index = _users.indexWhere((u) => u.id == user.id);
          if (index != -1) {
            _users[index] = result;
          }
        }
      });
    }
  }

  void _deleteUser(String id) {
    setState(() {
      _users.removeWhere((user) => user.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Admin'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const SignInPage()),
                (route) => false,
              );
            },
          ),
        ],
      ),
      body:
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    color: Colors.blue[50],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Daftar Pengguna',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => _addOrUpdateUser(null),
                          child: const Text('Tambah'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child:
                        _users.isEmpty
                            ? const Center(
                              child: Text('Belum ada data pengguna'),
                            )
                            : ListView.builder(
                              itemCount: _users.length,
                              itemBuilder: (context, index) {
                                final user = _users[index];
                                return Card(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  child: ListTile(
                                    leading: const CircleAvatar(
                                      child: Icon(Icons.person),
                                    ),
                                    title: Text(user.name),
                                    subtitle: Text(user.email),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.visibility),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder:
                                                    (context) => UserDetailPage(
                                                      user: user,
                                                    ),
                                              ),
                                            );
                                          },
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.edit),
                                          onPressed:
                                              () => _addOrUpdateUser(user),
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.delete),
                                          onPressed: () => _deleteUser(user.id),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                  ),
                ],
              ),
    );
  }
}
