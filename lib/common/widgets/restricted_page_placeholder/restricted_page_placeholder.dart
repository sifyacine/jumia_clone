import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/authentication/screens/login/login_screen.dart';

class RestrictedPagePlaceholder extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;

  const RestrictedPagePlaceholder({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(imageUrl), // Replace with your own image or use AssetImage
            const SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const LoginScreen()); // Navigate to login screen
                },
                child: Text('Sign In to Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
