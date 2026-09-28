import 'package:flutter/material.dart';
import 'poli_page.dart';
import 'pegawai_page.dart';
import 'pasien_page.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.local_hospital, color: Colors.white, size: 40),
                SizedBox(height: 10),
                Text(
                  'Klinik App Menu',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.local_hospital),
            title: const Text('Data Poli'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const PoliPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Data Pegawai'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const PegawaiPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.personal_injury),
            title: const Text('Data Pasien'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const PasienPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
