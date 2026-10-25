import 'package:flutter/material.dart';
import './helpers/user_info.dart';
import './ui/beranda.dart';
import './ui/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var token = await UserInfo().getToken();
  // ignore: avoid_print
  print(token);
  runApp(MyApp(token: token));
}

class MyApp extends StatelessWidget {
  final String? token;
  const MyApp({super.key, this.token});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Klinik APP - DARELL RANGGA PUTRA RACHMAN',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.blue,
      ),
      home: token == null ? const Login() : const Beranda(),
    );
  }
}