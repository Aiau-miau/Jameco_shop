import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import 'package:new_app/providers/cart_provider';

class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Product product =
        ModalRoute.of(context)!.settings.arguments as Product;
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        actions: [
          Consumer<CartProvider>(
            builder: (context, cart, child) {
              return Stack(
                children: [
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.pushNamed(context, '/cart');
                    },
                  ),
                  if (cart.items.isNotEmpty)
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '${cart.items.length}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              product.imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    product.description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      cartProvider.addToCart(product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Added to cart!'),
                          duration: Duration(seconds: 2),
                          action: SnackBarAction(
                            label: 'View Cart',
                            onPressed: () {
                              Navigator.pushNamed(context, '/cart');
                            },
                          ),
                        ),
                      );
                    },
                    child: Text('Add to Cart'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
