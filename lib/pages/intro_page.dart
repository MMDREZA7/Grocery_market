import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_market/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          // logo
          Padding(
            padding: const EdgeInsets.fromLTRB(80, 160, 80, 40),
            child: Image.asset('images/grocery.png'),
          ),

          // we deliver groceries at your doorstep
          Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              'We deliver groceries at your doorstep',
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSerif(
                fontWeight: FontWeight.bold,
                fontSize: 36,
              ),
            ),
          ),

          const SizedBox(height: 24),

          // fresh items everyday
          Text(
            'Fresh items everyday',
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),

          const Spacer(),

          // get started button
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.deepPurple,
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          const Spacer(),
        ],
      ),
    );
  }
}
