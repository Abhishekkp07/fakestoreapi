import 'dart:developer';

import 'package:fakestoreapi/app_config/app_config.dart';
import 'package:fakestoreapi/respository/api/homescreen/model/homescreen_model.dart';
import 'package:fakestoreapi/respository/helper/apihelper.dart';

class CategoryScreenService{
  static Future<dynamic>getData(String categoryValues)async{
    try{
      var decodeData= await ApiHelper.getData(endPoint: "/products/category/$categoryValues");
      log("service=>" +decodeData.toString());
      if(decodeData != null && decodeData["status"]==1){
        log("suceesfully");
        return decodeData;
      }else{
        log("failed  : ${decodeData?["status"]}");
        return null;
      }
    }catch (e){

      log('error : $e');
      return null;
    }
  }
}