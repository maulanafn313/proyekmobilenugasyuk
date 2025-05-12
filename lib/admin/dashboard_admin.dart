import 'package:flutter/material.dart';
import '../signin.dart';
import '../models/user_model.dart';
import 'edit_user_page.dart';

class AdminDashboardPage extends StatefulWidget {
  const AdminDashboardPage({super.key});

  @override
  State<AdminDashboardPage> createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> {
  // TODO: Ganti dengan data dari API/database
  final List<User> _users = [
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

  void _addOrUpdateUser(User? user) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditUserPage(user: user)),
    );

    if (result != null && result is User) {
      setState(() {
        if (user == null) {
          // Tambah pengguna baru
          _users.add(result);
        } else {
          // Update pengguna yang ada
          final index = _users.indexWhere((u) => u.id == user.id);
          if (index != -1) {
            _users[index] = result;
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Admin Dashboard',
          style: TextStyle(color: Colors.white),
        ),
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Manajemen Pengguna',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () => _addOrUpdateUser(null),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Tambah Pengguna',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: DataTable(
                  columnSpacing: 24,
                  horizontalMargin: 24,
                  columns: const [
                    DataColumn(
                      label: SizedBox(width: 150, child: Text('Nama')),
                    ),
                    DataColumn(
                      label: SizedBox(width: 200, child: Text('Email')),
                    ),
                    DataColumn(
                      label: SizedBox(width: 200, child: Text('Alamat')),
                    ),
                    DataColumn(
                      label: SizedBox(
                        width: 150,
                        child: Text('Kabupaten/Kota'),
                      ),
                    ),
                    DataColumn(
                      label: SizedBox(width: 150, child: Text('Provinsi')),
                    ),
                    DataColumn(
                      label: SizedBox(width: 100, child: Text('Aksi')),
                    ),
                  ],
                  rows:
                      _users.map((user) {
                        return DataRow(
                          cells: [
                            DataCell(
                              SizedBox(
                                width: 150,
                                child: Text(
                                  user.name,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            DataCell(
                              SizedBox(
                                width: 200,
                                child: Text(
                                  user.email,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            DataCell(
                              SizedBox(
                                width: 200,
                                child: Text(
                                  user.address,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            DataCell(
                              SizedBox(
                                width: 150,
                                child: Text(
                                  user.city,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            DataCell(
                              SizedBox(
                                width: 150,
                                child: Text(
                                  user.province,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            DataCell(
                              SizedBox(
                                width: 100,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.blue,
                                      ),
                                      onPressed: () => _addOrUpdateUser(user),
                                      padding: EdgeInsets.zero,
                                      constraints: const BoxConstraints(),
                                    ),
                                    const SizedBox(width: 8),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder:
                                              (context) => AlertDialog(
                                                title: const Text(
                                                  'Konfirmasi Hapus',
                                                ),
                                                content: const Text(
                                                  'Apakah Anda yakin ingin menghapus pengguna ini?',
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed:
                                                        () => Navigator.pop(
                                                          context,
                                                        ),
                                                    child: const Text('Batal'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        _users.removeWhere(
                                                          (u) =>
                                                              u.id == user.id,
                                                        );
                                                      });
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text(
                                                      'Hapus',
                                                      style: TextStyle(
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                        );
                                      },
                                      padding: EdgeInsets.zero,
                                      constraints: const BoxConstraints(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
