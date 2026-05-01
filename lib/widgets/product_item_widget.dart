import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/product_provider.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: const Icon(Icons.favorite_border),
            color: Theme.of(context).colorScheme.secondary,
            onPressed: () {},
          ),
          title: Text(
            product.name,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.shopping_cart),
            color: Theme.of(context).colorScheme.secondary,
            onPressed: () {
              productProvider.addProductToCart(product);
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text(
                    'تمت إضافة المنتج إلى السلة!',
                  ),
                  duration: const Duration(seconds: 2),
                  action: SnackBarAction(
                    label: 'تراجع',
                    onPressed: () {
                      productProvider.removeSingleItem(product.id);
                    },
                  ),
                ),
              );
            },
          ),
        ),
        child: Image.asset(
          product.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}