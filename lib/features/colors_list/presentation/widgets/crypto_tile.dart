import 'dart:math';
import 'package:flutter/material.dart';

class CryptoTile extends StatelessWidget {
  final String symbol;
  final String priceUsd;

  const CryptoTile({super.key, required this.symbol, required this.priceUsd});

  @override
  Widget build(BuildContext context) {
    final color = Color.fromRGBO(
      Random().nextInt(256),
      Random().nextInt(256),
      Random().nextInt(256),
      1,
    );

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: color,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            symbol,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Text("\$$priceUsd", style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
