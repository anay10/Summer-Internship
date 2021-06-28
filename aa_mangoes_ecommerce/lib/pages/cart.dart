import 'package:flutter/material.dart';
import 'package:aa_mangoes_ecommerce/components/cart_products.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 255, 130, 67),
        title: new Text("Cart"),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
        ],
      ),
      body: new Cart_Products(),
      bottomNavigationBar: new Container(
        color: Colors.white,
        child: new Row(
          children: <Widget>[
            Expanded(
                child: new ListTile(
              title: new Text("Total:"),
              subtitle: new Text("₹20,000"),
            )),
            Expanded(
                child: new MaterialButton(
              onPressed: () {},
              child: new Text(
                "Check Out",
                style: TextStyle(color: Colors.white),
              ),
              color: Color.fromARGB(255, 255, 130, 67),
            ))
          ],
        ),
      ),
    );
  }
}
