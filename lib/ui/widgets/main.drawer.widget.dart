import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white,Theme.of(context).primaryColor]
              )
            ),
              child: Row(
            children: const [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("images/profile.jpeg"),
              )
            ],
          ))
        ],
      ),
    );
  }
}
