import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:new_app/providers/cart_provider';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.items;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          'Shopping Cart',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.white,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text('Clear Cart'),
                  content: Text('Are you sure you want to clear the cart?'),
                  actions: [
                    TextButton(
                      child: Text('No'),
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                    ),
                    ElevatedButton(
                      child: Text('Yes'),
                      onPressed: () {
                        cartProvider.clearCart();
                        Navigator.of(ctx).pop();
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: cartItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart_outlined,
                      size: 100, color: Colors.grey),
                  SizedBox(height: 20),
                  Text(
                    'Your cart is empty',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (ctx, index) {
                final cartItem = cartItems[index];
                return Dismissible(
                  key: Key(cartItem.product.id),
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  direction: DismissDirection.endToStart,
                  onDismissed: (_) {
                    cartProvider.removeFromCart(cartItem.product.id);
                  },
                  child: ListTile(
                    leading: Image.asset(
                      cartItem.product.imageUrl,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                    title: Text(cartItem.product.name),
                    subtitle:
                        Text('\$${cartItem.product.price.toStringAsFixed(2)}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove_circle_outline),
                          onPressed: () {
                            if (cartItem.quantity > 1) {
                              cartProvider.updateQuantity(
                                  cartItem.product.id, cartItem.quantity - 1);
                            }
                          },
                        ),
                        Text('${cartItem.quantity}'),
                        IconButton(
                          icon: Icon(Icons.add_circle_outline),
                          onPressed: () {
                            cartProvider.updateQuantity(
                                cartItem.product.id, cartItem.quantity + 1);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: cartItems.isNotEmpty
          ? BottomAppBar(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total: \$${cartProvider.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // TODO: Implement checkout process
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Checkout process started'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      child: Text('Checkout'),
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : null,
    );
  }
}
