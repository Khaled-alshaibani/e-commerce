import 'package:flutter/material.dart';
import '../models/product.dart';
import '../models/cart_item.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _products = [
    Product(
      id: 'p1',
      name: 'سماعات رأس لاسلكية',
      description: 'سماعات رأس عالية الجودة مع إلغاء الضوضاء.',
      price: 99.99,
      imageUrl: 'assets/images/headphone.webp',
    ),
    Product(
      id: 'p2',
      name: 'ساعة ذكية',
      description: 'تتبع لياقتك البدنية وتلقي الإشعارات.',
      price: 199.99,
      imageUrl: 'assets/images/smart_watch.webp',
    ),
    Product(
      id: 'p3',
      name: 'كاميرا رقمية',
      description: 'التقط صورًا ومقاطع فيديو مذهلة.',
      price: 499.99,
      imageUrl: 'assets/images/camera.webp',
    ),
    Product(
      id: 'p4',
      name: 'لوحة مفاتيح ميكانيكية',
      description: 'تجربة كتابة مريحة ودقيقة.',
      price: 79.99,
      imageUrl: 'assets/images/keyboard.webp',
    ),
    Product(
      id: 'p5',
      name: 'ماوس ألعاب',
      description: 'ماوس عالي الأداء للاعبين.',
      price: 49.99,
      imageUrl: 'assets/images/gaming_mouse.webp',
    ),
  ];

  List<Product> get products {
    return [..._products];
  }

  List<Product> get latestProducts {
    return _products.sublist(0, _products.length > 3 ? 3 : _products.length);
  }

  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems {
    return [..._cartItems];
  }

  int get cartItemsCount {
    return _cartItems.length;
  }

  double get totalAmount {
    var total = 0.0;
    for (var cartItem in _cartItems) {
      total += cartItem.product.price * cartItem.quantity;
    }
    return total;
  }

  void addProductToCart(Product product) {
    final existingCartItemIndex = _cartItems.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (existingCartItemIndex >= 0) {
      _cartItems[existingCartItemIndex].incrementQuantity();
    } else {
      _cartItems.add(CartItem(product: product));
    }
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    final existingCartItemIndex = _cartItems.indexWhere(
      (item) => item.product.id == productId,
    );

    if (existingCartItemIndex >= 0) {
      if (_cartItems[existingCartItemIndex].quantity > 1) {
        _cartItems[existingCartItemIndex].decrementQuantity();
      } else {
        _cartItems.removeAt(existingCartItemIndex);
      }
      notifyListeners();
    }
  }

  void removeItem(String productId) {
    _cartItems.removeWhere((item) => item.product.id == productId);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}