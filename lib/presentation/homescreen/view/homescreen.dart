import 'package:fakestoreapi/global_widgets/item_card.dart';
import 'package:fakestoreapi/presentation/homescreen/controller/homescreen_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
   Provider.of<HomeScreenController>(context,listen: false).fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:  Text("Store",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26),),centerTitle: true,backgroundColor: Colors.grey[50],),
      body: Consumer<HomeScreenController>(builder: (context,controller,child)=>controller.isLoading==true?Center(child: CircularProgressIndicator(),):

      GridView.builder(

        itemCount:controller.productModel.data?.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            // crossAxisSpacing: 10,
            //   mainAxisSpacing:10,
              crossAxisCount: 2,childAspectRatio: .52),
          itemBuilder:(context,index){
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Itemcard(
              title: controller.productModel.data?[index].title??"",
              image: controller.productModel.data?[index].image??"",
              price: controller.productModel.data?[index].price??0,
              category: controller.productModel.data?[index].category.toString(),
            ),
          );
          }),
      ));
  }
}
