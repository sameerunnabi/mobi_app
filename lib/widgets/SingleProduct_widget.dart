import 'package:flutter/material.dart';
import 'package:mobi_app/model/data_products.dart';
import 'package:mobi_app/model/single_product_model.dart';

import '../model/data_products.dart';

class SingleProductWidget extends StatefulWidget {
  final int index;
  String productImage;
  String productName;
  String productModel;
  double productPrice;
  double productOldPrice;
  Function onPressed;
  List<SingleProductModel> cartlist;

  SingleProductWidget({
    required this.productImage,
    required this.productName,
    required this.productModel,
    required this.productPrice,
    required this.productOldPrice,
    required this.onPressed,
    required this.index,
    required this.cartlist,
    Key? key,
  }) : super(key: key);

  @override
  State<SingleProductWidget> createState() => _SingleProductWidgetState();
}

class _SingleProductWidgetState extends State<SingleProductWidget> {
  List<SingleProductModel> selectedProducts = [];
  // void _onFavoritePressed() {
  //   setState(() {
  //     if (sigleProductData[widget.index].isselected) {
  //       sigleProductData[widget.index].isselected = false;
  //       widget.cartlist.remove(
  //           sigleProductData[widget.index]); // <-- remove product from cartlist
  //     } else {
  //       sigleProductData[widget.index].isselected = true;
  //       widget.cartlist
  //           .add(sigleProductData[widget.index]); // <-- add product to cartlist
  //     }
  //   });
  // }

  // void _onFavoritePressed() {
  //   setState(() {
  //     if (widget.cartlist.contains(sigleProductData[widget.index])) {
  //       // If product is already in cart, remove it
  //       widget.cartlist.remove(sigleProductData[widget.index]);
  //       sigleProductData[widget.index].isselected =
  //           false; // <-- Set isselected to false
  //     } else {
  //       // If product is not in cart, add it
  //       widget.cartlist.add(sigleProductData[widget.index]);
  //       sigleProductData[widget.index].isselected =
  //           true; // <-- Set isselected to true
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Colors.transparent, borderRadius: BorderRadius.circular(5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              alignment: Alignment.topRight,
              decoration: BoxDecoration(
                  color: Colors.grey[10],
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.productImage),
                  )),
              // child: IconButton(
              //   onPressed:
              //       // _onFavoritePressed, // <-- call _onFavori
              //       //tePressed function

              //       (() {
              //     if (sigleProductData[widget.index].isselected) {
              //       sigleProductData[widget.index].isselected = false;
              //       widget.cartlist.remove(sigleProductData[
              //           widget.index]); // <-- remove product from cartlist
              //     } else {
              //       sigleProductData[widget.index].isselected = true;
              //       widget.cartlist.add(sigleProductData[
              //           widget.index]); // <-- add product to cartlist
              //     }
              //   }),
              //   icon: sigleProductData[widget.index].isselected
              //       ? Icon(
              //           Icons.shopping_cart_rounded,
              //           color: Colors.red,
              //         )
              //       : Icon(
              //           Icons.shopping_cart_outlined,
              //           color: Colors.grey,
              //         ),
              // ),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    final product = sigleProductData[widget.index];
                    product.isselected =
                        !product.isselected; // Toggle product selection
                    if (product.isselected) {
                      widget.cartlist.add(product); // Add product to cart
                    } else {
                      widget.cartlist
                          .remove(product); // Remove product from cart
                    }
                  });
                },
                icon: Icon(
                  sigleProductData[widget.index].isselected
                      ? Icons.shopping_cart_rounded
                      : Icons.shopping_cart_outlined,
                  color: sigleProductData[widget.index].isselected
                      ? Colors.red
                      : Colors.grey,
                ),
              ),
            ),
          ),
          // ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.productName,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.productModel,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.pink),
                ),
                Row(
                  children: [
                    Text(
                      "\$ ${widget.productPrice}",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "\$ ${widget.productOldPrice}",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.lineThrough),
                    ),
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    ));
  }
}
