import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Itemcard extends StatelessWidget {

  final String? title;
  final double? price;
  final String? image;
  final String? category;

  const Itemcard({super.key, this.title, this.price, this.image, this.category});

  @override
  Widget build(BuildContext context) {
    var hight=MediaQuery.of(context).size.height;

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(decoration: BoxDecoration(color:Colors.grey[100]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius:BorderRadius.circular(15) ,
                child: Container(
                 height: hight*.2,
                  child: Image.network("$image",fit: BoxFit.fill,),
                ),
              ),
              SizedBox(height: 20,),
              Text("$title"),
              Text("$price",style: TextStyle(fontWeight: FontWeight.bold),),
              Text("$category")
            ],
          ),
        ),
      ),
    );
  }
}
