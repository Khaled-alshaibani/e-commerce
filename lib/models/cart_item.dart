import '../models/product.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });

  void incrementQuantity() {
    quantity++;
  }

  void decrementQuantity() {
    if (quantity > 1) {
      quantity--;
    }
  }
}
