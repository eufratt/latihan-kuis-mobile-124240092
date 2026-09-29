import 'package:flutter/material.dart';
import 'package:latkuis/views/home.dart';
import 'package:latkuis/views/profile.dart';


class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [HomePage(), ProfilPage()];
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ]
      ),
    );
  }
}