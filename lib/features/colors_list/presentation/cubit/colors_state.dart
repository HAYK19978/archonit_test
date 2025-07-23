import '../../domain/entities/crypto_entity.dart';

abstract class ColorsState {
  final List<CryptoEntity> list;
  const ColorsState(this.list);
}

class ColorsInitial extends ColorsState {
  ColorsInitial() : super([]);
}

class ColorsLoading extends ColorsState {
  ColorsLoading(super.list);
}

class ColorsLoaded extends ColorsState {
  ColorsLoaded(super.list);
}

class ColorsError extends ColorsState {
  final String message;
  ColorsError(super.list, this.message);
}
