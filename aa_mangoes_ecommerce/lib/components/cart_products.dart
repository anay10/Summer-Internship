import 'package:flutter/material.dart';

class Cart_Products extends StatefulWidget {
  @override
  _Cart_ProductsState createState() => _Cart_ProductsState();
}

class _Cart_ProductsState extends State<Cart_Products> {
  var Product_On_The_Cart = [
    {
      "name": "Mangoes",
      "picture": "images/products/alpMangoes.jpg",
      "price": 1500,
      "quantity": "12 doz."
    },
    {
      "name": "Natural Pulp",
      "picture": "images/products/alpNatpulp.jpeg",
      "price": 1500,
      "quantity": "12 doz."
    },
    {
      "name": "Alp. Pulp",
      "picture": "images/products/alpPulp.jpeg",
      "price": 1500,
      "quantity": "12 doz."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: Product_On_The_Cart.length,
        itemBuilder: (context, index) {
          return new Single_Cart_Product(
            cart_prod_name: Product_On_The_Cart[index]["name"],
            cart_prod_picture: Product_On_The_Cart[index]["picture"],
            cart_prod_price: Product_On_The_Cart[index]["price"],
            cart_prod_quantity: Product_On_The_Cart[index]["quantity"],
          );
        });
  }
}

class Single_Cart_Product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_quantity;

  Single_Cart_Product(
      {this.cart_prod_name,
      this.cart_prod_picture,
      this.cart_prod_price,
      this.cart_prod_quantity});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        //========== LEADING SECTION ==========
        leading: new Image.asset(cart_prod_picture, width: 80.0, height: 80.0,),
        //========== TITLE SECTION ==========
        title: new Text(cart_prod_name),
        //========== SUBTITILE SECTION ==========
        subtitle: new Column(
          children: <Widget>[
            new Row(
              //========== THIS SECTION IS FOR QUANTITY ==========
              children: [
                new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text("Quantity:"),
                ),
                new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text(
                    cart_prod_quantity,
                    style: TextStyle(color: Color.fromARGB(255, 255, 130, 67)),
                  ),
                ),
              ],
            ),
            //========== THIS SECTION IS FOR PRICE ==========
            new Container(
              alignment: Alignment.topLeft,
              child: new Text(
                "₹${cart_prod_price}",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 130, 67),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
