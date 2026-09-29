import 'package:flutter/material.dart';
import 'package:latkuis/models/data.dart';
import 'package:latkuis/views/detail.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: menus.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(context, 
                MaterialPageRoute(builder: (context)
                => DetailPage(menu: menus[index],)
                )
              );
            },
            title: Text(menus[index].name),
            subtitle: Text("Rp ${menus[index].price}"),
            leading: Image.network(menus[index].image, 
            width: 50,
            height: 50,
            ),
            trailing: Icon(Icons.arrow_forward_ios),
          );
        },
      );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("Home"),
    //   ),
    //   body: ListView.builder(
    //     itemCount: menus.length,
    //     itemBuilder: (context, index) {
    //       return ListTile(
    //         onTap: () {
    //           Navigator.push(context, 
    //             MaterialPageRoute(builder: (context)
    //             => DetailPage(product: menus[index],)
    //             )
    //           );
    //         },
    //         title: Text(menus[index].name),
    //         subtitle: Text("Rp ${menus[index].price}"),
    //         leading: Image.network(menus[index].image, 
    //         width: 50,
    //         height: 50,
    //         ),
    //         trailing: Icon(Icons.arrow_forward_ios),
    //       );
    //     },
    //   ),
    // );
  }
}