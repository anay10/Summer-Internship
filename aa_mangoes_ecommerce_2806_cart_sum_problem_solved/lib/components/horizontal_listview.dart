import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: new ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
              image_location: 'images/cat/amsul.png',
              image_caption: 'Peels'
          ),
          Category(
              image_location: 'images/cat/cordial.png',
              image_caption: 'Cordial'
          ),
          Category(
              image_location: 'images/cat/gulkand.png',
              image_caption: 'Gulkand'
          ),
          Category(
              image_location: 'images/cat/mango.png',
              image_caption: 'Mangoes'
          ),
          Category(
              image_location: 'images/cat/pulp.png',
              image_caption: 'Pulp'
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({this.image_location, this.image_caption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 20.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Image.asset(
              image_location,
              width: 100.0,
              height: 100.0,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(image_caption),
            ),
          ),
        ),
      ),
    );
  }
}
