import 'package:flutter/material.dart';
import 'package:grocery_market/components/grocery_item_tile.dart';
import 'package:grocery_market/models/cart_model.dart';
import 'package:grocery_market/pages/intro_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      builder: (context, child) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: IntroPage(),
      ),
    );
  }
}
