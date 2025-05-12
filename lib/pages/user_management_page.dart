import 'package:flutter/material.dart';
import '../models/user.dart';

class UserManagementPage extends StatefulWidget {
  const UserManagementPage({Key? key}) : super(key: key);

  @override
  State<UserManagementPage> createState() => _UserManagementPageState();
}

class _UserManagementPageState extends State<UserManagementPage> {
  List<User> users = [
    User(
      name: 'Agnes Putra',
      email: 'gkurniawan@example.net',
      address: 'Jl. Mawar No. 1',
      city: 'Jakarta',
      province: 'DKI Jakarta',
    ),
    User(
      name: 'Agus Pusp... ',
      email: 'xsuryono@example.com',
      address: 'Jl. Melati No. 2',
      city: 'Bandung',
      province: 'Jawa Barat',
    ),
    User(
      name: 'Hana Hardiansyah',
      email: 'habibi.gading@example.com',
      address: 'Jl. Kenanga No. 3',
      city: 'Surabaya',
      province: 'Jawa Timur',
    ),
    User(
      name: 'Harjaya Nasyiah',
      email: 'lidya.iswahyudi@example.net',
      address: 'Jl. Anggrek No. 4',
      city: 'Semarang',
      province: 'Jawa Tengah',
    ),
    User(
      name: 'Hasim Zulaika',
      email: 'hassanah.genta@example.com',
      address: 'Jl. Dahlia No. 5',
      city: 'Yogyakarta',
      province: 'DI Yogyakarta',
    ),
    User(
      name: 'Heru Saptono',
      email: 'hendra.hastuti@example.org',
      address: 'Jl. Flamboyan No. 6',
      city: 'Medan',
      province: 'Sumatera Utara',
    ),
    User(
      name: 'Hesti Hakim',
      email: 'rsitorus@example.org',
      address: 'Jl. Cempaka No. 7',
      city: 'Palembang',
      province: 'Sumatera Selatan',
    ),
    User(
      name: 'Ibrahim Thamrin',
      email: 'faizah25@example.org',
      address: 'Jl. Teratai No. 8',
      city: 'Makassar',
      province: 'Sulawesi Selatan',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Row(
          children: [
            Image.asset('images/logo nugasyuk-Layer 1 (1).png', height: 36),
            const SizedBox(width: 8),
            const Text(
              'Nugas Yuk!',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // TODO: Navigasi ke halaman tambah user
            },
            tooltip: 'Tambah Pengguna',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Manajemen Pengguna',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Daftar pengguna yang terdaftar dalam sistem',
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: users.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final user = users[index];
                  return ListTile(
                    title: Text(user.name),
                    subtitle: Text(user.email),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {
                            // TODO: Edit user
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            // TODO: Hapus user
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
