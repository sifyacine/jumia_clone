import 'package:flutter/material.dart';

import '../../../../../common/widgets/appbar/appbar.dart';

class SellerPage extends StatelessWidget {
  const SellerPage({Key? key, required this.sellerName}) : super(key: key);
  final String sellerName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(sellerName, style: const TextStyle(color: Colors.white)),
        showBackArrow: true,

      ),
    );
  }
}
