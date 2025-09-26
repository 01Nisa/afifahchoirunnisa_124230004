import 'package:flutter/material.dart';

class profilPage extends StatelessWidget {
  const profilPage({super.key});

  final String _username = 'Afifah Choirunnisa';
  final String _nim = '124230004';
  final String _ttl = 'Batam, 2004-05-14';
  final String _hobi = 'Belajar';
  final String _profileImageUrl = 'img/profil.jpg'; 

  Widget _buildProfileDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),

          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Divider(height: 16, thickness: 1, color: Color(0xFFE0E0E0)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PROFIL"),
        backgroundColor:  Colors.blueGrey, 
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(_profileImageUrl),
                    backgroundColor: Colors.grey.shade200,
                  ),
      
                ],
              ),
            ),
            const SizedBox(height: 32),

            _buildProfileDetailRow('Nama', _username),
            _buildProfileDetailRow('NIM', _nim),
            _buildProfileDetailRow('Tempat & Tanggal Lahir', _ttl),
            _buildProfileDetailRow('Hobi', _hobi),
          ],
        ),
      ),
    );
  }
}