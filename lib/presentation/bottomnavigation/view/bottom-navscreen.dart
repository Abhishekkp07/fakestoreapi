import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/bottomnav_controller.dart';

class BottomScreen extends StatelessWidget {
  const BottomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.of<BottomNavController>(context)
      .myPages[Provider.of<BottomNavController>(context).selectedindex],

      bottomNavigationBar:BottomNavigationBar(
        currentIndex: Provider.of<BottomNavController>(context).selectedindex,
          onTap: (index)=> Provider.of<BottomNavController>(context,listen: false).onItemTap(index),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.category),label: ""),

          ]) ,
    );
  }
}
