import 'package:fakestoreapi/presentation/bottomnavigation/controller/bottomnav_controller.dart';
import 'package:fakestoreapi/presentation/bottomnavigation/view/bottom-navscreen.dart';
import 'package:fakestoreapi/presentation/category/controller/category_controller.dart';
import 'package:fakestoreapi/presentation/homescreen/controller/homescreen_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( FakeStore(),);
}
class FakeStore extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=>HomeScreenController()),
      ChangeNotifierProvider(create: (context)=>BottomNavController()),
      ChangeNotifierProvider(create: (context)=>CategoryController()),
    ],child: MaterialApp(home: BottomScreen(),),);
  }

}