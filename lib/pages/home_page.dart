import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../widgets/product_item_widget.dart';
import '../pages/cart_page.dart';
import '../pages/product_list_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);
    final latestProducts = productData.latestProducts;

    return Scaffold(
      appBar: AppBar(
        title: const Text('متجر إلكتروني'),
        backgroundColor: Colors.deepOrangeAccent,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (ctx) => const CartPage()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => const ProductListPage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'أحدث المنتجات',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: latestProducts.length,
              itemBuilder: (ctx, i) => ProductItem(product: latestProducts[i]),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
