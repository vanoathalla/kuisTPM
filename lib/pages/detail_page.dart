import 'package:flutter/material.dart';
import '../data/product.dart'; // Import model data lu

class DetailPage extends StatefulWidget {
  final Product product;
  DetailPage({required this.product});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: widget.product.isFavorite ? Colors.red : Colors.white,
            ),
            onPressed: () {
              setState(() {
                widget.product.isFavorite = !widget.product.isFavorite;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Image.network(widget.product.image),
          Text(widget.product.name, style: TextStyle(fontSize: 24)),
          Text(widget.product.category),
          Text("Price: IDR ${widget.product.price}"),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(widget.product.description),
          ),
        ],
      ),
    );
  }
}
