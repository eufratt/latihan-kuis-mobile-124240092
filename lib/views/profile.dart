import 'package:flutter/material.dart';
import 'package:latkuis/views/login.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(onPressed: () {
        Navigator.pushAndRemoveUntil(
        context, 
        MaterialPageRoute(builder: (context) => LoginPage()), 
        (route) => false,
        );
      }, 
      child: Text("Logout")
      ),
    );
  }
}