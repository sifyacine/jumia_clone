import 'package:flutter/material.dart';


class LastSeenProductsScreen extends StatelessWidget {
  const LastSeenProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Last Seen Products'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image
              Image.asset(
                'assets/images/no_products.png', // Replace with your asset path
                height: 150,
                width: 150,
              ),
              const SizedBox(height: 20),

              // Texts
              const Text(
                'No products have been seen recently',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'You have no product that have been seen recently.',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              // Elevated Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {

                  },
                  child: Text(
                    'Continue Shopping',
                    style: TextStyle(fontSize: 16),
                  ),

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
