import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'screens/product_detail_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/profile_screen.dart';
import 'package:new_app/providers/cart_provider';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: ClothesShopApp(),
    ),
  );
}

class ClothesShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fashion Hub',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/product-detail': (context) => ProductDetailScreen(),
        '/cart': (context) => CartScreen(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}
