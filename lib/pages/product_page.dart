import 'package:flutter/material.dart';
import '../data/product.dart'; // Import model data lu
import 'detail_page.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: products.length, // Pake data dari product.dart
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            child: Column(
              children: [
                Expanded(child: Image.network(product.image)),
                Text(product.name, style: TextStyle(fontWeight: BOLD)),
                Text("Rating: ${product.rating}"),
                Text("IDR ${product.price}"),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(product: product),
                      ),
                    );
                  },
                  child: Text("More"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
