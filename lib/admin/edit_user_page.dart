import 'package:flutter/material.dart';
import '../models/user_model.dart';

class EditUserPage extends StatefulWidget {
  final User? user;

  const EditUserPage({super.key, this.user});

  @override
  State<EditUserPage> createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  // Controller untuk input
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _provinceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Isi form jika sedang edit
    if (widget.user != null) {
      _nameController.text = widget.user!.name;
      _emailController.text = widget.user!.email;
      _addressController.text = widget.user!.address;
      _cityController.text = widget.user!.city;
      _provinceController.text = widget.user!.province;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _provinceController.dispose();
    super.dispose();
  }

  void _saveUser() {
    // Buat user baru
    final user = User(
      id: widget.user?.id ?? DateTime.now().toString(),
      name: _nameController.text,
      email: _emailController.text,
      address: _addressController.text,
      city: _cityController.text,
      province: _provinceController.text,
    );

    // Kembali ke halaman sebelumnya dengan data
    Navigator.pop(context, user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user == null ? 'Tambah Pengguna' : 'Edit Pengguna'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Form input
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nama',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _addressController,
              decoration: const InputDecoration(
                labelText: 'Alamat',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _cityController,
              decoration: const InputDecoration(
                labelText: 'Kota',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _provinceController,
              decoration: const InputDecoration(
                labelText: 'Provinsi',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            // Tombol simpan
            ElevatedButton(onPressed: _saveUser, child: const Text('Simpan')),
          ],
        ),
      ),
    );
  }
}
