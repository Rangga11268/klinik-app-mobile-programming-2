import 'package:flutter/material.dart';
import 'beranda.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.local_hospital,
                  size: 70,
                  color: Colors.blue,
                ),
                const SizedBox(height: 10),
                const Text(
                  "Klinik APP",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  "DARELL RANGGA PUTRA RACHMAN - No. Absen: 37",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 35),
                const Text(
                  "Login Admin",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 25),
                Center(
                  child: Form(
                    key: _formKey,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width > 500
                          ? 400
                          : MediaQuery.of(context).size.width / 1.25,
                      child: Column(
                        children: [
                          _usernameTextField(),
                          const SizedBox(height: 15),
                          _passwordTextField(),
                          const SizedBox(height: 30),
                          _tombolLogin(),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _usernameTextField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Username",
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.person),
      ),
      controller: _usernameCtrl,
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
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
      obscureText: _obscurePassword,
      controller: _passwordCtrl,
    );
  }

  Widget _tombolLogin() {
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
          String username = _usernameCtrl.text.trim();
          String password = _passwordCtrl.text.trim();

          // Validasi login sederhana (admin / admin atau langsung masuk)
          if ((username == "admin" && password == "admin") ||
              (username.isNotEmpty && password.isNotEmpty) ||
              (username.isEmpty && password.isEmpty)) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Beranda()),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Username atau Password salah!"),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: const Text(
          "Login",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
