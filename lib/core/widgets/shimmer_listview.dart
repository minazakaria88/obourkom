import 'package:flutter/material.dart';
import 'package:oborkom/core/widgets/shimmer_item.dart';

class ShimmerListview extends StatelessWidget {
  const ShimmerListview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) =>
          const ShimmerItem(height: 150, width: double.infinity, margin: 12),
    );
  }
}
