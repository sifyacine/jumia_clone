import 'package:flutter/material.dart';

class CouponsPage extends StatelessWidget {
  const CouponsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Coupons'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Active'),
              Tab(text: 'Not Active'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            // Active Coupons Tab
            ActiveCouponsTab(),

            // Not Active Coupons Tab
            NotActiveCouponsTab(),
          ],
        ),
      ),
    );
  }
}

class ActiveCouponsTab extends StatelessWidget {
  const ActiveCouponsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Replace with actual implementation
    return Center(
      child: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: 5, // Replace with actual number of active coupons
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              title: Text('Active Coupon #${index + 1}'),
              subtitle: const Text('Valid until 31/12/2024'),
              trailing: const Icon(Icons.check_circle, color: Colors.green),
            ),
          );
        },
      ),
    );
  }
}

class NotActiveCouponsTab extends StatelessWidget {
  const NotActiveCouponsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Replace with actual implementation
    return Center(
      child: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: 3, // Replace with actual number of not active coupons
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              title: Text('Not Active Coupon #${index + 1}'),
              subtitle: const Text('Expired on 30/06/2024'),
              trailing: const Icon(Icons.cancel, color: Colors.red),
            ),
          );
        },
      ),
    );
  }
}
