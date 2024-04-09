
import 'dart:developer';

import 'package:fakestoreapi/respository/api/homescreen/model/homescreen_model.dart';
import 'package:flutter/widgets.dart';

import '../../../respository/api/categoryscreen/service/categoryscreen_service.dart';

class CategoryController extends ChangeNotifier{
  List<String> categorylist=["electronics", "jewelery", "men's clothing", "women's clothing"];

  String category ="electronics";

  onTap({required int index}){
    category=categorylist[index].toLowerCase();
    fetchData();
    print(category);
    notifyListeners();
  }

  ProductModel productModel=ProductModel();
  bool isLoading =false;

  fetchData()async{
    isLoading=true;
    notifyListeners();
    try{
      var data= await CategoryScreenService.getData(category);
      if(data!=null){
        productModel=ProductModel.fromJson(data);
        isLoading=false;
      }else{
        log("failed");
      }
      notifyListeners();
    }catch(e){
      log("$e");
    }
  }
}