import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_market/models/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Consumer<CartModel>(
        builder: (context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'My Cart',
                  style: GoogleFonts.notoSerif(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: value.cartItems.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        title: Text(
                          value.cartItems[index][0],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          '\$ ${value.cartItems[index][1]}',
                        ),
                        leading: Image.asset(
                          value.cartItems[index][2],
                        ),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.cancel,
                          ),
                          onPressed: () =>
                              Provider.of<CartModel>(context, listen: false)
                                  .removeItemFromCart(index),
                        ),
                      ),
                    );
                  },
                ),
              ),
              // total + pay now
              Padding(
                padding: const EdgeInsets.all(36),
                child: GestureDetector(
                  onTap: () {
                    print('Payed!');
                  },
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // price
                            Text(
                              'Total Price',
                              style: TextStyle(
                                color: Colors.green[100],
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              ' \$ ' + value.calculateTotalPrice(),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),

                        // pay Now Button
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green.shade100),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: const Row(
                            children: [
                              Text(
                                'Pay Now',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.white,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
