import 'package:fakestoreapi/presentation/category/controller/category_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../global_widgets/item_card.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
   void fetchData()async{
     Provider.of<CategoryController>(context,listen: false).fetchData();
   }
   @override
  void initState() {
     fetchData();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    CategoryController provider =Provider.of<CategoryController>(context);
    return DefaultTabController(
        length: provider.categorylist.length,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Categories",style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          bottom: TabBar(
              tabs:List.generate(
                  provider.categorylist.length,
                      (index) => Tab(text: provider.categorylist[index],)
              ),
              onTap: (value){
                provider.onTap(index:value);
          },
          ),
          ),
      body: ListView.separated(
          itemBuilder:(context,index)=> Itemcard(
            title: provider.productModel.data?[index].title
                .toString()??
              "",
            category:provider.productModel.data?[index].category
              .toString()??
              "",
            price: provider.productModel.data?[index].price??0
            ,
            image: provider.productModel.data?[index].image
            .toString()??"",

          ),

          separatorBuilder:(context,index)=> Divider(height: 20,),
          itemCount: provider.productModel.data?.length??0),
        ));
  }
}
