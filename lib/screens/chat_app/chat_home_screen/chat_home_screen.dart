import 'package:flutter/material.dart';
import 'package:flutter_test_app/const/cach_helper/cach_helper.dart';

class ChatHomeScreen extends StatelessWidget {
   ChatHomeScreen({Key? key}) : super(key: key);

  List<String> text=["ah","am"];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text("Chat",style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),),
          bottom: TabBar(
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15
            ),
              labelColor: Colors.black,
              tabs: [
            Tab(
              text: "Chat",
            ),
            Tab(
              text: "Stories",
            ),
            Tab(
              text: "Settings",
            )
          ]),
        ),
        body: TabBarView(children: [
          ListView.separated(itemBuilder: (context,index)=>Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: Image.network("https://images.unsplash.com/photo-1517466787929-bc90951d0974?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vdGJhbGwlMjBwbGF5ZXJ8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60").image,
                ),
                SizedBox(width: 8,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Ahmed Fadlallah",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black
                      ),),
                      Text("Hi Ahmed , What are you doing?",style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Colors.grey
                      ),),
                    ],
                  ),
                ),
                Text("1-9-2023,5:14",style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.grey
                ),)
              ],
            ),
          ), separatorBuilder: (context,index)=>SizedBox(height: 8,),
              itemCount: 8),

          TextButton(onPressed: (){
            CachHelper.removeData(key: "name");
          }, child:           Text("clear"),
          ),
          Text("3"),
        ]),
      ),
    );
  }
}
