import '../entities/crypto_entity.dart';

abstract class ColorsRepository {
  Future<List<CryptoEntity>> fetchCryptos({
    required int offset,
    required int limit,
  });
}
