import 'package:flutter/material.dart';
import 'package:flutter_test_app/const/app_images.dart';
import 'package:flutter_test_app/screens/car_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(
          Icons.menu,
          color: Colors.amber,
        ),
        title: Text(
          "Home",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                color: Colors.amber,
              )),
          CircleAvatar(
            backgroundColor: Colors.amber,
            radius: 15,
            child: Icon(
              Icons.shopping_cart,
              color: Colors.green,
              size: 18,
            ),
          ),
          CircleAvatar(
            radius: 15,
            backgroundImage: Image.asset(AppImages.personImage).image,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello Ahmed",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Brands",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 1,
                            offset: Offset(0, 1),
                            color: Colors.grey.withOpacity(0.2))
                      ],
                      image: DecorationImage(
                          image: Image.asset(AppImages.bmwLogo).image)),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 1,
                            offset: Offset(0, 1),
                            color: Colors.grey.withOpacity(0.2))
                      ],
                      image: DecorationImage(
                          image: Image.asset(AppImages.bmwLogo).image)),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 1,
                            offset: Offset(0, 1),
                            color: Colors.grey.withOpacity(0.2))
                      ],
                      image: DecorationImage(
                          image: Image.asset(AppImages.bmwLogo).image)),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 1,
                            offset: Offset(0, 1),
                            color: Colors.grey.withOpacity(0.2))
                      ],
                      image: DecorationImage(
                          image: Image.asset(AppImages.bmwLogo).image)),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 1,
                            offset: Offset(0, 1),
                            color: Colors.grey.withOpacity(0.2))
                      ],
                      image: DecorationImage(
                          image: Image.asset(AppImages.bmwLogo).image)),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 1,
                            offset: Offset(0, 1),
                            color: Colors.grey.withOpacity(0.2))
                      ],
                      image: DecorationImage(
                          image: Image.asset(AppImages.bmwLogo).image)),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 1,
                            offset: Offset(0, 1),
                            color: Colors.grey.withOpacity(0.2))
                      ],
                      image: DecorationImage(
                          image: Image.asset(AppImages.bmwLogo).image)),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 1,
                            offset: Offset(0, 1),
                            color: Colors.grey.withOpacity(0.2))
                      ],
                      image: DecorationImage(
                          image: Image.asset(AppImages.bmwLogo).image)),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CarDetailsScreen()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 1,
                            offset: Offset(0, 1),
                            color: Colors.grey.withOpacity(0.2))
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage(AppImages.opel),
                            width: 150,
                          ),
                          Text(
                            "Opel Car",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Colors.black),
                          ),
                          Text(
                            "speed: 200",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          Text(
                            "price: 1800 \$",
                            style: TextStyle(fontSize: 14, color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 1,
                          offset: Offset(0, 1),
                          color: Colors.grey.withOpacity(0.2))
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage(AppImages.classic),
                          width: 150,
                        ),
                        Text(
                          "Classic Car",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.black),
                        ),
                        Text(
                          "speed: 200",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        Text(
                          "price: 1800 \$",
                          style: TextStyle(fontSize: 14, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 1,
                          offset: Offset(0, 1),
                          color: Colors.grey.withOpacity(0.2))
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage(AppImages.nissan),
                          width: 150,
                        ),
                        Text(
                          "Nisssan Car",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.black),
                        ),
                        Text(
                          "speed: 200",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        Text(
                          "price: 1800 \$",
                          style: TextStyle(fontSize: 14, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 1,
                          offset: Offset(0, 1),
                          color: Colors.grey.withOpacity(0.2))
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage(AppImages.bmw),
                          width: 150,
                        ),
                        Text(
                          "Bmw Car",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.black),
                        ),
                        Text(
                          "speed: 200",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        Text(
                          "price: 1800 \$",
                          style: TextStyle(fontSize: 14, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
