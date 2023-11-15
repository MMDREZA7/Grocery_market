import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_market/models/cart_model.dart';
import 'package:grocery_market/pages/cart_page.dart';
import 'package:provider/provider.dart';

import '../components/grocery_item_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CartPage(),
          ),
        ),
        child: const Icon(
          Icons.shopping_bag,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 48),

            // good morning
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text('Good morning'),
            ),

            const SizedBox(height: 8),

            // let's order flesh items for you
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Let\'s order flesh items for you',
                style: GoogleFonts.notoSerif(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // divider
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Divider(),
            ),

            const SizedBox(height: 24),

            // fresh items +grid
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Fresh items',
                style: TextStyle(fontSize: 16),
              ),
            ),

            Expanded(
              child: Consumer<CartModel>(
                builder: (BuildContext context, value, Widget? child) =>
                    GridView.builder(
                  itemCount: value.shopItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1 / 1.3, crossAxisCount: 2),
                  padding: const EdgeInsets.all(12),
                  itemBuilder: (context, index) {
                    return GroceryItemTile(
                      itemName: value.shopItems[index][0],
                      itemPrice: value.shopItems[index][1],
                      imagePath: value.shopItems[index][2],
                      color: value.shopItems[index][3],
                      onPressed: () {
                        Provider.of<CartModel>(context, listen: false)
                            .addItemToCart(index);
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
