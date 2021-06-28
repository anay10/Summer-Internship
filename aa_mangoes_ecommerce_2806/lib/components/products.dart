import 'package:flutter/material.dart';
import 'package:aa_mangoes_ecommerce/pages/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name": "Mangoes",
      "picture": "images/products/alpMangoes.jpg",
      "old_price": 1800,
      "price": 1500
    },
    {
      "name": "Natural Pulp",
      "picture": "images/products/alpNatpulp.jpeg",
      "old_price": 1800,
      "price": 1500
    },
    {
      "name": "Alp. Pulp",
      "picture": "images/products/alpPulp.jpeg",
      "old_price": 1800,
      "price": 1500
    },
    {
      "name": "Tid Bits",
      "picture": "images/products/alpTidbits.jpeg",
      "old_price": 1800,
      "price": 1500
    },
    {
      "name": "Gulkanda",
      "picture": "images/products/gJam.jpg",
      "old_price": 1800,
      "price": 1500
    },
    {
      "name": "Mng. Cordial",
      "picture": "images/products/gmCordial.jpeg",
      "old_price": 180,
      "price": 150
    },
    {
      "name": "Kokm. Cordial",
      "picture": "images/products/kCordial.jpeg",
      "old_price": 180,
      "price": 150
    },
    {
      "name": "Alp. Bites",
      "picture": "images/alphonsobites.jpeg",
      "old_price": 180,
      "price": 150
    }
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(1.0),
            child: Single_Prod(
              prod_name: product_list[index]["name"],
              prod_picture: product_list[index]["picture"],
              prod_old_price: product_list[index]["old_price"],
              prod_price: product_list[index]["price"],
            ),
          );
        });
  }
}

class Single_Prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Single_Prod(
      {this.prod_name,
      this.prod_picture,
      this.prod_old_price,
      this.prod_price});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Hero(
      tag: prod_name,
      child: Material(
        child: InkWell(
          onTap: () => Navigator.of(context).push(new MaterialPageRoute(
              builder: (context) => new ProductDetails(
                    //passing attributes of product to product details
                    product_details_name: prod_name,
                    product_details_new_price: prod_price,
                    product_details_old_price: prod_old_price,
                    product_details_picture: prod_picture,
                  ))),
          child: GridTile(
            footer: Container(
                color: Colors.white70,
                child: new Row(
                  children: <Widget>[
                    Expanded(
                        child: new Text(
                      prod_name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    )),
                    new Text(
                      "₹${prod_price}",
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 130, 67),
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )),
            child: Image.asset(
              prod_picture,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    ));
  }
}
