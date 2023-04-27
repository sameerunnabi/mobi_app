import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobi_app/home/cart_screen.dart';

import 'body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List cartlist = [];
  int indexselected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
            padding: EdgeInsets.only(left: 2.0),
            onPressed: () {},
            icon: (SvgPicture.asset("assets/icons/menu.svg"))),
        title: Text(
          "Categories",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          // IconButton(
          //     onPressed: () {
          //       setState(() {
          //         Navigator.push(context,
          //             MaterialPageRoute(builder: (context) => CartScreen()));
          //       });
          //     },
          //     icon: Icon(Icons.shopping_cart_outlined))

          Center(
            child: cartlist.length == 0
                ? Container(
                    width: 0,
                  )
                : Text(
                    cartlist.length.toString(),
                    style: TextStyle(color: Colors.orange),
                  ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreen(
                      cartlist: [],
                    ),
                  ),
                );
              });
            },
            icon: Icon(
              Icons.shopping_cart,
            ),
          ),
        ],
      ),
      body: Body(),
    );
  }
}
