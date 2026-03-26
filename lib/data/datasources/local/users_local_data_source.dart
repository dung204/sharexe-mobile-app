import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:sharexe/data/models/user_model.dart';

@injectable
class UsersLocalDataSource {
  UsersLocalDataSource(this._prefs);
  final SharedPreferences _prefs;

  static const String _usersKey = 'cached_users';
  static const String _userPrefix = 'cached_user_';

  static const String _currentUserKey = 'current_logged_in_user';

  Future<void> cacheCurrentUser(UserModel user) async {
    try {
      final String userJson = json.encode(user.toJson());
      await _prefs.setString(_currentUserKey, userJson);

      await cacheUser(user);
    } catch (e) {
      // Handle error silently for cache operations
    }
  }

  Future<UserModel?> getCachedCurrentUser() async {
    try {
      final String? userJson = _prefs.getString(_currentUserKey);
      if (userJson != null) {
        return UserModel.fromJson(json.decode(userJson));
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<void> clearCurrentUser() async {
    try {
      await _prefs.remove(_currentUserKey);
    } catch (e) {
      // Handle error silently for cache operations
    }
  }

  Future<List<UserModel>> getCachedUsers() async {
    try {
      final String? usersJson = _prefs.getString(_usersKey);
      if (usersJson != null) {
        final List<dynamic> usersList = json.decode(usersJson);
        return usersList.map((json) => UserModel.fromJson(json)).toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<UserModel?> getCachedUser(int id) async {
    try {
      final String? userJson = _prefs.getString('$_userPrefix$id');
      if (userJson != null) {
        return UserModel.fromJson(json.decode(userJson));
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<void> cacheUsers(List<UserModel> users) async {
    try {
      final String usersJson = json.encode(
        users.map((user) => user.toJson()).toList(),
      );
      await _prefs.setString(_usersKey, usersJson);

      // Also cache individual users for quick access
      for (final user in users) {
        await cacheUser(user);
      }
    } catch (e) {
      // Handle error silently for cache operations
    }
  }

  Future<void> cacheUser(UserModel user) async {
    try {
      final String userJson = json.encode(user.toJson());
      await _prefs.setString('$_userPrefix${user.id}', userJson);
    } catch (e) {
      // Handle error silently for cache operations
    }
  }

  Future<void> clearUserCache() async {
    try {
      await _prefs.remove(_usersKey);

      // Remove individual user caches
      final keys = _prefs.getKeys();
      for (final key in keys) {
        if (key.startsWith(_userPrefix)) {
          await _prefs.remove(key);
        }
      }
    } catch (e) {
      // Handle error silently for cache operations
    }
  }

  Future<void> removeUserFromCache(int id) async {
    try {
      await _prefs.remove('$_userPrefix$id');
    } catch (e) {
      // Handle error silently for cache operations
    }
  }
}
