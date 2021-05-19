import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

//user defined packages
import 'package:aa_mangoes_ecommerce/components/horizontal_listview.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 300.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/alphonsotin2.jpg'),
          AssetImage('images/alphonso.jpg'),
          AssetImage('images/alphonsobites.jpeg'),
          AssetImage('images/kokam.jpg'),
          AssetImage('images/mangopulp.jpeg'),
        ],
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 5.0,
        indicatorBgPadding: 8.0,
      ),
    );
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 255, 130, 67),
        title: Text('A&A mangoes'),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search), onPressed: () {}),
          new IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {})
        ],
      ),
      drawer: new Drawer(
        child: ListView(children: <Widget>[
          // Header
          new UserAccountsDrawerHeader(
            accountName: Text('Anay Damle'),
            accountEmail: Text('anay.damle@gmail.com'),
            currentAccountPicture: GestureDetector(
              child: new CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, color: Colors.white),
              ),
            ),
          decoration: new BoxDecoration(
            color: Color.fromARGB(255, 255, 130, 67),
          ),
          ),
        //body
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('Home Page'),
              leading: Icon(Icons.home),
            ),
          ),
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('My Account'),
              leading: Icon(Icons.person),
            ),
          ),
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('My Orders'),
              leading: Icon(Icons.shopping_basket),
            ),
          ),
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('Categories'),
              leading: Icon(Icons.dashboard),
            ),
          ),
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('Favourites'),
              leading: Icon(Icons.favorite),
            ),
          ),
          Divider(),
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings),
            ),
          ),
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('About'),
              leading: Icon(Icons.help),
            ),
          ),
        ]),
      ),
      body: ListView(
        children: <Widget>[
          image_carousel,
          //padding widget
          new Padding(padding: const EdgeInsets.all(8.0),
          child: new Text('Categories'),
          ),
          //Horizontal List begins here
          HorizontalList(),
        ],
      ),
    );
  }
}
