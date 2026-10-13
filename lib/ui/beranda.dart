import 'package:flutter/material.dart';
import 'sidebar.dart';
import 'poli_37.dart';
import 'pegawai_page.dart';
import 'pasien_page.dart';
import 'login.dart';

class Beranda extends StatelessWidget {
  const Beranda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Beranda - DARELL RANGGA PUTRA RACHMAN",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 3),
            Text(
              "No. Absen: 37",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.0),
            child: CircleAvatar(
              radius: 19,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 17,
                backgroundImage: AssetImage("assets/img/profile-picture.png"),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Selamat Datang di Aplikasi",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Aplikasi ini memberikan pengalaman yang luar biasa",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 40),

              // Quick Actions Container (Persis seperti tampilan proyektor)
              SizedBox(
                width: 280,
                child: Column(
                  children: [
                    // Baris 1: 3 Kotak Quick Actions
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildQuickActionItem(
                          context: context,
                          icon: Icons.accessible,
                          tooltip: "Poli",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Poli37(),
                              ),
                            );
                          },
                        ),
                        _buildQuickActionItem(
                          context: context,
                          icon: Icons.people,
                          tooltip: "Pegawai",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PegawaiPage(),
                              ),
                            );
                          },
                        ),
                        _buildQuickActionItem(
                          context: context,
                          icon: Icons.account_box,
                          tooltip: "Pasien",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PasienPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Baris 2: 1 Kotak Keluar (Logout)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _buildQuickActionItem(
                          context: context,
                          icon: Icons.logout_rounded,
                          tooltip: "Keluar",
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Login(),
                              ),
                              (route) => false,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  child: Column(
                    children: [
                      Text(
                        "DARELL RANGGA PUTRA RACHMAN",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "No. Absen: 37 | Mobile Programming II",
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActionItem({
    required BuildContext context,
    required IconData icon,
    required String tooltip,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(12),
      elevation: 3,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          width: 76,
          height: 76,
          alignment: Alignment.center,
          child: Icon(
            icon,
            size: 38,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
