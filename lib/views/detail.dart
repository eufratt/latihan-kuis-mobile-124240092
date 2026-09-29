import 'package:flutter/material.dart';
import 'package:latkuis/models/data.dart';

class DetailPage extends StatelessWidget {
  final Menu menu;

  const DetailPage({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(menu.name),
      ),
      body: 
      Column(
        children: [
          Image.network(menu.image),
          Text(menu.price)
        ],
      ),
    );
  }
}