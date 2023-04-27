import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/data_products.dart';
import '../model/single_product_model.dart';

class CartScreen extends StatefulWidget {
  final List<SingleProductModel> cartlist;

  const CartScreen({
    required this.cartlist,
    Key? key,
  }) : super(key: key);
  // const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int quantity = 1;
  // int indexselected = 0;
  double totalPrice = 0;
  double totalDiscount = 0;

  // int totalSellingPrice = 0;
  // List favoritelist = [];
  final size = Get.size;

  // void calculatePrice() {
  //   for (var item in cartlist) {
  //     totalPrice = totalPrice + cartlist[indexselected].productPrice;
  //     totalDiscount = totalDiscount + item.productPrice * 30 / 100;
  //   }
  // }
  void calculatePrice() {
    // totalPrice = 0;
    // totalDiscount = 0;
    for (var item in widget.cartlist) {
      totalPrice += item.productPrice;
      totalDiscount += item.productPrice * 30 / 100;
    }
  }

  @override
  Widget build(BuildContext context) {
    // print(cartlist);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Your Cart"),
          foregroundColor: Colors.orange,
          actions: [
            IconButton(
              onPressed: () {
                // setState(() {
                //   Navigator.push(context, MaterialPageRoute(builder: (context)=>FavoriteItem()),);

                // });
              },
              icon: Icon(
                Icons.favorite,
              ),
            ),
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
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
              ),
            ),
          ],
        ),
        // drawer: DrawerB(),
        body: Column(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.all(20),
                child: ListView.builder(
                    itemCount: cartlist.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return productcard(index);
                    }),
              ),
            )
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: size.height / 12,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Rs $totalPrice",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Container(
                  height: size.height / 18,
                  width: size.width / 2.8,
                  alignment: Alignment.center,
                  color: Colors.blueAccent,
                  child: Text(
                    "Checkout",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget productcard(int index) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      height: 300,
      width: 400,
      child: Stack(
        children: [
          Align(
            alignment: Alignment(0, 0),
            child: Image.network(
              cartlist[index].productImage,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Align(
              alignment: Alignment(-1, 1),
              child: Text(
                cartlist[index].productName,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(-1, -1),
            child: IconButton(
                onPressed: () {
                  setState(() {
                    cartlist.removeAt(index);
                  });
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.black,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment(1, -1),
              child: Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    "${cartlist[index].productOldPrice}% off",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment(1, 0.6),
              child: Text(
                "Price: \$${cartlist[index].productPrice}",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment(1, 0.8),
              child: Text(
                "Discount: \$${cartlist[index].productPrice * 30 / 100}",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment(1, 1),
              child: Text(
                "Total Price: \$${cartlist[index].productPrice * 100 ~/ 30 * quantity}",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),
          ),
          Align(
            alignment: Alignment(-1, 0.6),
            child: Container(
              width: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (quantity < 1) {
                          quantity = quantity;
                        } else {
                          quantity = quantity - 1;
                        }
                      });
                    },
                    icon: Icon(
                      Icons.remove,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    quantity.toString(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        quantity = quantity + 1;
                      });
                    },
                    icon: Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
