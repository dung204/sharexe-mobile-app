import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sharexe/domain/entities/hub_entity.dart';

part '../../../../../generated/presentation/modules/search/cubit/search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = _Initial;
  const factory SearchState.loading() = _Loading;
  const factory SearchState.loaded(List<HubEntity> hubs) = _Loaded;
  const factory SearchState.empty() = _Empty;
  const factory SearchState.error(String message) = _Error;
}
