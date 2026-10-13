import 'package:flutter/material.dart';
import 'beranda.dart';
import 'login.dart';
import 'poli_37.dart';
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
          const UserAccountsDrawerHeader(
            accountName: Text(
              "DARELL RANGGA PUTRA RACHMAN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            accountEmail: Text("No. Absen: 37 | Klinik APP"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 34,
                backgroundImage: AssetImage("assets/img/profile-picture.png"),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.blue),
            title: const Text("Beranda"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Beranda()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.meeting_room, color: Colors.blue),
            title: const Text("Data Poli"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Poli37()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.people, color: Colors.blue),
            title: const Text("Data Pegawai"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const PegawaiPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.accessible, color: Colors.blue),
            title: const Text("Data Pasien"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const PasienPage()),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout_rounded, color: Colors.red),
            title: const Text(
              "Keluar",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
