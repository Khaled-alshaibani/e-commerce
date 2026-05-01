import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../widgets/cart_item_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('سلة التسوق'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'الإجمالي',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Theme.of(context).primaryTextTheme.titleLarge?.color,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  TextButton(
                    onPressed: () {
                      cart.clearCart();
                    },
                    child: const Text('اطلب الآن'),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: cart.cartItems.length,
              itemBuilder: (ctx, i) => CartItemWidget(
                cart.cartItems[i].product.id,
                cart.cartItems[i].product.name,
                cart.cartItems[i].quantity,
                cart.cartItems[i].product.price,
                cart.cartItems[i].product.imageUrl,
              ),
            ),
          )
        ],
      ),
    );
  }
}