import 'package:flutter/material.dart';
import 'package:latkuis/root.dart';
import '../models/data.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoggedIn = false;

  void login() {
    String username = usernameController.text;
    String password = passwordController.text;

    if (username == user1.username && password == user1.password) {
      setState(() {
        isLoggedIn = true;
      });

    Navigator.pushReplacement(context, 
    MaterialPageRoute(builder: (context) => Root()),
    );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text("Login Berhasil"),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text("Login Gagal. Username atau Password Salah"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                SizedBox(
                  height: 200 ,
                  child: Image.network("https://iconlogovector.com/uploads/images/2025/08/lg-688e9cd4b2d3d-Mie-Gacoan.webp")),
                SizedBox(height: 50),
                Text("Selamat Datang di Gacoan"),
                SizedBox(height: 30),
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    hintText: "username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 40,
                  width: 180,
                  child: ElevatedButton(
                    onPressed: login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 96, 124, 247),
                    ),
                    child: Text("Login"),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
