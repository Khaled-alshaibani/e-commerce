import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './pages/home_page.dart';
import './pages/product_list_page.dart';
import './pages/cart_page.dart';
import 'providers/product_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => ProductProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'متجر إلكتروني',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple).copyWith(secondary: Colors.deepOrange),
          fontFamily: 'Lato',
        ),
        home: const HomePage(),
        routes: {
          '/products': (ctx) => const ProductListPage(),
          '/cart': (ctx) => const CartPage(),
        },
      ),
    );
  }
}