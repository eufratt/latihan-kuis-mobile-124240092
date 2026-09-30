import 'package:flutter/material.dart';
import 'package:latkuis/models/data.dart';
import 'package:latkuis/views/detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 1. Pilihan kategori yang tersedia
  final List<String> categories = ["Semua", "Mie", "Dimsum", "Minuman"];

  // 2. State kategori & kata kunci pencarian
  String selectedCategory = "Semua";
  String searchQuery = "";

  // 3. Getter untuk menyaring daftar menu berdasarkan Kategori & Kata Kunci
  List<Menu> get filteredMenus {
    return menus.where((item) {
      final matchesCategory =
          selectedCategory == "Semua" || item.category == selectedCategory;
      final matchesSearch =
          item.name.toLowerCase().contains(searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 4. Kolom Input Pencarian (Search Bar)
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
          child: TextField(
            onChanged: (value) {
              setState(() {
                searchQuery = value;
              });
            },
            decoration: InputDecoration(
              hintText: "Cari menu Gacoan...",
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.grey.shade100,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
            ),
          ),
        ),

        // 5. Deretan tombol kategori
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: categories.map((category) {
              final isSelected = selectedCategory == category;
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ChoiceChip(
                  label: Text(category),
                  selected: isSelected,
                  selectedColor: Colors.blueAccent,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : Colors.black87,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                  onSelected: (selected) {
                    if (selected) {
                      setState(() {
                        selectedCategory = category;
                      });
                    }
                  },
                ),
              );
            }).toList(),
          ),
        ),

        // 6. Daftar menu atau Teks "Tidak ditemukan"
        Expanded(
          child: filteredMenus.isEmpty
              ? const Center(
                  child: Text(
                    "Menu tidak ditemukan",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                )
              : ListView.builder(
                  itemCount: filteredMenus.length,
                  itemBuilder: (context, index) {
                    final menu = filteredMenus[index];
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(menu: menu),
                          ),
                        );
                      },
                      title: Text(menu.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            menu.category,
                            style: TextStyle(
                                color: Colors.grey[600], fontSize: 12),
                          ),
                          Text(
                            menu.price,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          menu.image,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      trailing:
                          const Icon(Icons.arrow_forward_ios, size: 16),
                    );
                  },
                ),
        ),
      ],
    );
  }
}