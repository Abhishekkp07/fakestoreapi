import 'dart:developer';

import '../../../helper/apihelper.dart';

class HomeScreenService{
  static Future<dynamic>getData() async {
    try{
      var decodeData = await ApiHelper.getData(endPoint:"/products");
      log('service=>' + decodeData.toString());
      if(decodeData != null && decodeData["status"]==1){
        log("successfully");
        return decodeData;
      }else{
        log("failed :${decodeData?["status"]} ");
        return null;
      }
    }catch (e){
      log("error : $e");
      return null;
    }
  }
}