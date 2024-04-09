import 'package:fakestoreapi/presentation/homescreen/view/homescreen.dart';
import 'package:flutter/widgets.dart';

import '../../category/view/category_screen.dart';

class BottomNavController extends ChangeNotifier{
  int selectedindex=0;

  void onItemTap(index){
    selectedindex=index;
    notifyListeners();
  }
  List<Widget> myPages=[HomeScreen(),CategoryScreen()];
}