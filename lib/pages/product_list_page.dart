import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../widgets/product_item_widget.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);
    final products = productData.products;

    return Scaffold(
      appBar: AppBar(
        title: const Text('المنتجات'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: products.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: products[i],
          child: ProductItem(
            product: products[i],
          ),
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}