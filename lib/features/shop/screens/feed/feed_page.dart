import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Feed', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
