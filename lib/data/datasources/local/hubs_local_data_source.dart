import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharexe/data/models/hub_model.dart';

abstract class HubsLocalDataSource {
  Future<void> cacheNearbyHubs(List<HubModel> hubs);
  Future<List<HubModel>> getCachedNearbyHubs();
}

const cachedNearbyHubsKey = 'CACHED_NEARBY_HUBS';

@Injectable(as: HubsLocalDataSource)
class HubsLocalDataSourceImpl implements HubsLocalDataSource {
  HubsLocalDataSourceImpl(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  @override
  Future<void> cacheNearbyHubs(List<HubModel> hubs) {
    final List<Map<String, dynamic>> jsonList = hubs
        .map((hub) => hub.toJson())
        .toList();
    final jsonString = json.encode(jsonList);
    return sharedPreferences.setString(cachedNearbyHubsKey, jsonString);
  }

  @override
  Future<List<HubModel>> getCachedNearbyHubs() {
    final jsonString = sharedPreferences.getString(cachedNearbyHubsKey);
    if (jsonString != null) {
      final List<dynamic> jsonList = json.decode(jsonString);
      final List<HubModel> hubs = jsonList
          .map(
            (jsonItem) => HubModel.fromJson(jsonItem as Map<String, dynamic>),
          )
          .toList();
      return Future.value(hubs);
    } else {
      return Future.value([]);
    }
  }
}
