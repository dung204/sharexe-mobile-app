import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class AppPreferences {
  AppPreferences(this._prefs);

  final SharedPreferences _prefs;

  static const String isFirstRunKey = 'is_first_run';

  bool get isFirstRun => _prefs.getBool(isFirstRunKey) ?? true;

  Future<void> markOnboardingCompleted() async {
    await _prefs.setBool(isFirstRunKey, false);
  }
}
