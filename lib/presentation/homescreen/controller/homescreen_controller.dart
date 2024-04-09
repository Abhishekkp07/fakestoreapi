
import 'dart:developer';

import 'package:fakestoreapi/respository/api/homescreen/model/homescreen_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../respository/api/homescreen/service/homescreen_service.dart';

class HomeScreenController extends ChangeNotifier{
ProductModel productModel= ProductModel();
  bool isLoading=false;

  fetchData()async{
    isLoading=true;
    notifyListeners();
    try{
      var data= await HomeScreenService.getData();
      if(data!= null){
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