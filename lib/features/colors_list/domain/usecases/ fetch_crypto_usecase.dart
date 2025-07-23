import '../entities/crypto_entity.dart';
import '../repository/colors_repository.dart';

class FetchCryptoUseCase {
  final ColorsRepository repository;

  FetchCryptoUseCase(this.repository);

  Future<List<CryptoEntity>> call({required int offset, required int limit}) {
    return repository.fetchCryptos(offset: offset, limit: limit);
  }
}
