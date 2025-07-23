import 'package:dio/dio.dart';
import '../models/crypto_model.dart';
import '../../../../core/consts/api_keys.dart';
import '../../../../core/consts/app_urls.dart';

class ColorsRemoteDataSource {
  final Dio dio;

  ColorsRemoteDataSource(this.dio);

  Future<List<CryptoModel>> fetchCryptos({
    required int offset,
    required int limit,
  }) async {
    final url =
        '${AppUrls.baseUrl}?limit=$limit&offset=$offset&apiKey=${ApiKeys.apiKey}';
    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final data = List<Map<String, dynamic>>.from(response.data['data']);
      return data.map((e) => CryptoModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load crypto data');
    }
  }
}
