// ignore: file_names
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String name;
  final double? netPrice;

  const ProductPage({
    Key? key,
    required this.name,
    this.netPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: $name',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Net Price: ${netPrice ?? 'N/A'}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Expanded(
              child: Placeholder(),
            ),
          ],
        ),
      ),
    );
  }
}