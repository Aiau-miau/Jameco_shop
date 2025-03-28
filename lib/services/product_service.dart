import 'package:new_app/models/product.dart';

class ProductService {
  List<Product> getProducts() {
    return [
      Product(
        id: '1',
        name: 'JIHC braclet',
        description: "Braclet with college's logo ",
        price: 500,
        imageUrl: 'images/braclet.jpg',
        category: 'Braclet',
      ),
      Product(
        id: '2',
        name: 'Sweatshirt',
        description: 'Comfortable sweatshirt that made of cotton',
        price: 13000,
        imageUrl: 'images/swetshort.jpg',
        category: 'Clothes',
      ),
      Product(
        id: '3',
        name: 'T-shirt',
        description: 'T-shirt with our logo',
        price: 8000,
        imageUrl: 'images/t-shirt.jpg',
        category: 'Shirts',
      ),
      Product(
        id: '4',
        name: 'Bag',
        description: 'Bag for your laptop',
        price: 10000,
        imageUrl: 'images/bag.jpg',
        category: 'Bag',
      ),
    ];
  }
}
