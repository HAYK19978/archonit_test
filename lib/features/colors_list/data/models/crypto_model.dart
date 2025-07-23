import '../../domain/entities/crypto_entity.dart';

class CryptoModel extends CryptoEntity {
  CryptoModel({required super.symbol, required super.priceUsd});

  factory CryptoModel.fromJson(Map<String, dynamic> json) {
    return CryptoModel(
      symbol: json['symbol'] ?? '',
      priceUsd: json['priceUsd'] ?? '0.0',
    );
  }
}
