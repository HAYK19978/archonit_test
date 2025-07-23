import 'dart:math';
import 'package:archonit_test_prj/core/consts/app_colors.dart';
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
            style: const TextStyle(
              fontSize: 17,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
              fontFamily: 'SF-Pro',
              height: 24 / 17,
            ),
          ),
          const Spacer(),
          Text(
            "\$$priceUsd",
            style: TextStyle(
              fontSize: 17,
              color: AppColors.primaryColor,
              fontFamily: 'SF-Pro',
              fontWeight: FontWeight.w600,
              height: 24 / 17,
            ),
          ),
        ],
      ),
    );
  }
}
