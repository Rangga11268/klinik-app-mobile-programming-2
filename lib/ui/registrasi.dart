import 'package:flutter/material.dart';

class Registrasi extends StatefulWidget {
  const Registrasi({super.key});

  @override
  State<Registrasi> createState() => _RegistrasiState();
}

class _RegistrasiState extends State<Registrasi> {
  final _formKey = GlobalKey<FormState>();
  final _namaCtrl = TextEditingController();
  final _usernameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _confirmPasswordCtrl = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _namaCtrl.dispose();
    _usernameCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _confirmPasswordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registrasi Akun Baru"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
            child: Column(
              children: [
                const Icon(
                  Icons.app_registration,
                  size: 64,
                  color: Colors.blue,
                ),
                const SizedBox(height: 10),
                const Text(
                  "Daftar Akun Klinik",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "DARELL RANGGA PUTRA RACHMAN - No. Absen: 37",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 25),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _fieldNama(),
                      const SizedBox(height: 14),
                      _fieldUsername(),
                      const SizedBox(height: 14),
                      _fieldEmail(),
                      const SizedBox(height: 14),
                      _fieldPassword(),
                      const SizedBox(height: 14),
                      _fieldConfirmPassword(),
                      const SizedBox(height: 26),
                      _tombolDaftar(),
                      const SizedBox(height: 16),
                      _linkKeLogin(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _fieldNama() {
    return TextFormField(
      controller: _namaCtrl,
      decoration: const InputDecoration(
        labelText: "Nama Lengkap",
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.badge),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Nama Lengkap wajib diisi";
        }
        return null;
      },
    );
  }

  Widget _fieldUsername() {
    return TextFormField(
      controller: _usernameCtrl,
      decoration: const InputDecoration(
        labelText: "Username",
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.person),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Username wajib diisi";
        }
        if (value.trim().length < 4) {
          return "Username minimal 4 karakter";
        }
        return null;
      },
    );
  }

  Widget _fieldEmail() {
    return TextFormField(
      controller: _emailCtrl,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: "Email",
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.email),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Email wajib diisi";
        }
        if (!value.contains("@") || !value.contains(".")) {
          return "Format email tidak valid";
        }
        return null;
      },
    );
  }

  Widget _fieldPassword() {
    return TextFormField(
      controller: _passwordCtrl,
      obscureText: _obscurePassword,
      decoration: InputDecoration(
        labelText: "Password",
        border: const OutlineInputBorder(),
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePassword ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Password wajib diisi";
        }
        if (value.length < 6) {
          return "Password minimal 6 karakter";
        }
        return null;
      },
    );
  }

  Widget _fieldConfirmPassword() {
    return TextFormField(
      controller: _confirmPasswordCtrl,
      obscureText: _obscureConfirmPassword,
      decoration: InputDecoration(
        labelText: "Konfirmasi Password",
        border: const OutlineInputBorder(),
        prefixIcon: const Icon(Icons.lock_outline),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: () {
            setState(() {
              _obscureConfirmPassword = !_obscureConfirmPassword;
            });
          },
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Konfirmasi Password wajib diisi";
        }
        if (value != _passwordCtrl.text) {
          return "Konfirmasi Password tidak cocok!";
        }
        return null;
      },
    );
  }

  Widget _tombolDaftar() {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Registrasi berhasil untuk ${_namaCtrl.text.trim()}! Silakan login.",
                ),
                backgroundColor: Colors.green,
                duration: const Duration(seconds: 3),
              ),
            );
            Navigator.pop(context, {
              'username': _usernameCtrl.text.trim(),
              'password': _passwordCtrl.text,
            });
          }
        },
        child: const Text(
          "Daftar",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _linkKeLogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Sudah punya akun?"),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            "Login di sini",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
