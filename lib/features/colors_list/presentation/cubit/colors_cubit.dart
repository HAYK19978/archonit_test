import 'package:archonit_test_prj/features/colors_list/domain/usecases/%20fetch_crypto_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'colors_state.dart';

class ColorsCubit extends Cubit<ColorsState> {
  final FetchCryptoUseCase useCase;
  int offset = 0;
  final int limit = 20;
  bool hasMore = true;
  bool isLoading = false;

  ColorsCubit(this.useCase) : super(ColorsInitial());

  Future<void> fetchNext() async {
    if (isLoading || !hasMore) return;

    isLoading = true;
    emit(ColorsLoading(state.list));

    try {
      final newList = await useCase(offset: offset, limit: limit);
      offset += limit;
      hasMore = newList.length == limit;
      emit(ColorsLoaded([...state.list, ...newList]));
    } catch (e) {
      emit(ColorsError(state.list, e.toString()));
    }

    isLoading = false;
  }
}
