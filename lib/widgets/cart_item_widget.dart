import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';

class CartItemWidget extends StatelessWidget {
  final String productId;
  final String title;
  final int quantity;
  final double price;
  final String imageUrl;

  const CartItemWidget(
    this.productId,
    this.title,
    this.quantity,
    this.price,
    this.imageUrl,
  );

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(productId),
      background: Container(
        color: Theme.of(context).colorScheme.error,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<ProductProvider>(context, listen: false).removeItem(productId);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
            ),
            title: Text(title),
            subtitle: Text('الإجمالي: \$${(price * quantity).toStringAsFixed(2)}'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}