import 'package:flutter/material.dart';
import 'package:aa_mangoes_ecommerce/pages/cart.dart';
import 'package:aa_mangoes_ecommerce/components/globals.dart';

class ProductDetails extends StatefulWidget {
  final product_details_name;
  final product_details_new_price;
  final product_details_old_price;
  final product_details_picture;

  ProductDetails(
      {this.product_details_name,
      this.product_details_new_price,
      this.product_details_old_price,
      this.product_details_picture});



  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  void Add_To_Cart(){
    cart_list.add({
      "name": widget.product_details_name,
      "picture": widget.product_details_picture,
      "price": widget.product_details_new_price,
      "quantity": "12 doz."
    });
    cartTotalValue = cartTotalValue + widget.product_details_new_price;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 255, 130, 67),
        title: Text('A&A mangoes'),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search), onPressed: () {}),
          new IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => new Cart()));
          })
        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300,
            child: GridTile(
                child: Container(
                  color: Colors.white,
                  child: Image.asset(widget.product_details_picture),
                ),
                footer: new Container(
                  color: Colors.white70,
                  child: new ListTile(
                    leading: new Text(
                      widget.product_details_name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                    title: Row(
                      children: <Widget>[
                        Expanded(
                            child: Text(
                          "₹${widget.product_details_old_price}",
                          style: TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        )),
                        Expanded(
                            child: Text(
                          "₹${widget.product_details_new_price}",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 130, 67),
                              fontWeight: FontWeight.bold),
                        )),
                      ],
                    ),
                  ),
                )),
          ),

          //========== First Button ==========
          Row(
            children: <Widget>[
              Expanded(
                  child: MaterialButton(
                elevation: 0.2,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return new AlertDialog(
                          title: Text("Quantity"),
                          content: Text("Choose the quantity"),
                          actions: <Widget>[
                            new MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: new Text("close"),
                            ),
                          ],
                        );
                      });
                },
                color: Colors.white,
                textColor: Colors.grey,
                child: Row(
                  children: <Widget>[
                    Expanded(child: Text("Quantity")),
                    Expanded(child: new Icon(Icons.arrow_drop_down)),
                  ],
                ),
              ))
            ],
          ),

          //========== Second Button ==========
          Row(
            children: <Widget>[
              Expanded(
                  child: MaterialButton(
                      elevation: 0.2,
                      onPressed: () {},
                      color: Color.fromARGB(255, 255, 130, 67),
                      textColor: Colors.white,
                      child: Text("Buy Now"))),
              new IconButton(
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: Color.fromARGB(255, 255, 130, 67),
                  ),
                  onPressed: () {Add_To_Cart();}),
              new IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    color: Color.fromARGB(255, 255, 130, 67),
                  ),
                  onPressed: () {}),
            ],
          ),
          Divider(),
          new ListTile(
            title: new Text("Product Details"),
            subtitle: new Text(
                "Lorem Ipsum has been the industry's standard dummy text ever "
                    "since the 1500s, when an unknown printer took a galley of type "
                    "and scrambled it to make a type specimen book. It has survived not only five centuries, "
                    "but also the leap into electronic typesetting, remaining essentially unchanged. "
                    "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, "
                    "and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
          ),
          Divider(),
          Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0), child: new Text(
                "Product Name", style: TextStyle(color: Colors.grey ),
              ),),
              Padding(padding: const EdgeInsets.all(5.0), child: new Text(widget.product_details_name),),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0), child: new Text(
                "Cultivation Type", style: TextStyle(color: Colors.grey ),
              ),),
              Padding(padding: const EdgeInsets.all(5.0), child: new Text("Organic"),),
            ],
          ),
          Divider(),
          Padding(padding: const EdgeInsets.all(8.0),
          child: new Text("Similar Products"),),
          //SIMILAR PRODUCTS SECTION
          new Container(
            height: 360.0,
            child: Similar_Products(),
          ),
        ],
      ),
    );
  }
}

class Similar_Products extends StatefulWidget {

  @override
  _Similar_ProductsState createState() => _Similar_ProductsState();
}

class _Similar_ProductsState extends State<Similar_Products> {
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
          return Similar_Single_Prod(
            prod_name: product_list[index]["name"],
            prod_picture: product_list[index]["picture"],
            prod_old_price: product_list[index]["old_price"],
            prod_price: product_list[index]["price"],
          );
        });
  }
}

class Similar_Single_Prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Similar_Single_Prod(
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