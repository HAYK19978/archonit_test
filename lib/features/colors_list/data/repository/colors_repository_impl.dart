import 'package:archonit_test_prj/features/colors_list/data/dto/colors_remote_datasource.dart';

import '../../domain/entities/crypto_entity.dart';
import '../../domain/repository/colors_repository.dart';

class ColorsRepositoryImpl implements ColorsRepository {
  final ColorsRemoteDataSource remoteDataSource;

  ColorsRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<CryptoEntity>> fetchCryptos({
    required int offset,
    required int limit,
  }) {
    return remoteDataSource.fetchCryptos(offset: offset, limit: limit);
  }
}
