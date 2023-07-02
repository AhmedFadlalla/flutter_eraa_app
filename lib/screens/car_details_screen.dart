import 'package:flutter/material.dart';

import '../const/app_images.dart';

class CarDetailsScreen extends StatelessWidget {
  const CarDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Car Details Screen",style: TextStyle(
          fontSize: 22
        ),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage(AppImages.classic)),
          SizedBox(height: 8,),
          Container(
            width: 250,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(25)
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Text("Classic Car",style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 8,),
                  Text("Price : 250.0",style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 8,),
                  Text("speed : 100 K/H",style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                  ),),
                ],
              ),
            ),
          ),
          SizedBox(height: 8,),
          ElevatedButton(
              autofocus: false,

              style: ElevatedButton.styleFrom(

                shadowColor: Colors.transparent,
                elevation: 0,
               // backgroundColor: Colors.transparent
              ),
              onPressed: (){
                print("pressed");
              }, child: Text("Add To Cart"))
        ],
      ),
    );
  }
}
