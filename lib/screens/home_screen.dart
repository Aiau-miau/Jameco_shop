import 'package:flutter/material.dart';
import '../services/product_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProductService _productService = ProductService();

  @override
  Widget build(BuildContext context) {
    final products = _productService.getProducts();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          'Jameco Store',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        itemCount: products.length,
        itemBuilder: (ctx, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/product-detail',
                arguments: product,
              );
            },
            child: Card(
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.asset(
                      product.imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '${product.tengePrice}',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
