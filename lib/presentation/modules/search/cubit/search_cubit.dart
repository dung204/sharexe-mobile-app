import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sharexe/domain/usecases/hubs/search_hubs_usecase.dart';
import 'package:sharexe/presentation/modules/search/cubit/search_state.dart';
import 'dart:async';

@injectable
class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._searchHubsUseCase) : super(const SearchState.initial());

  final SearchHubsUseCase _searchHubsUseCase;
  Timer? _debounceTimer;

  void onSearchTextChanged(String keyword) {
    if (keyword.isEmpty) {
      _debounceTimer?.cancel();
      emit(const SearchState.initial());
      return;
    }

    if (_debounceTimer?.isActive ?? false) _debounceTimer?.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      emit(const SearchState.loading());
      final result = await _searchHubsUseCase(keyword: keyword);

      result.when(
        success: (hubs) {
          if (hubs.isEmpty) {
            emit(const SearchState.empty());
          } else {
            emit(SearchState.loaded(hubs));
          }
        },
        failure: (failure) {
          emit(SearchState.error(failure.message ?? 'Unknown error occurred'));
        },
      );
    });
  }

  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    return super.close();
  }
}
