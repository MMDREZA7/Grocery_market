import 'package:flutter/material.dart';

class GroceryItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final color;
  void Function()? onPressed;

  GroceryItemTile({
    super.key,
    required this.itemPrice,
    required this.imagePath,
    required this.itemName,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color[200],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // image
          Image.asset(
            imagePath,
            height: 64,
          ),

          // item name
          Text(itemName),

          // price + button
          MaterialButton(
            onPressed: onPressed,
            color: color[800],
            child: Text(
              '\$ ${itemPrice}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
