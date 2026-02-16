import 'dart:io';

import 'package:appwrite/models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:appwrite/appwrite.dart';
import 'package:margin/Utilities/Config.dart';

enum AccountStatus {
  uninitialized,
  authenticated,
  unauthenticated,
}

class BaseAPI extends ChangeNotifier {
  late User _currentUser;
  AccountStatus _status = AccountStatus.uninitialized;

  final Client _client = Client();
  String? _jwt;
  late Account _account;
  Map cachedTimetables = {};
  Map cachedPfpVersions = {};
  Map cachedNames = {};
  List? cachedFriends;
  Future<void>? caching;

  User get currentUser => _currentUser;
  AccountStatus get status => _status;
  String? get email => _currentUser.email;
  String? get userid => _currentUser.$id;
  Client get client => _client;
  User? get user => _currentUser;
  Account? get account => _account;

  BaseAPI() {
    init();
    loadUser();
  }

  Future<void> init() {
    _client
        .setEndpoint(MarginConfig.endpoint)
        .setProject(MarginConfig.projectId);
    _account = Account(_client);

    return Future.value();
  }

  Future<void> loadUser() async {
    try {
      final User user = await _account.get();
      _currentUser = user;
      _account = Account(_client);
      _status = AccountStatus.authenticated;
    } catch (e) {
      _status = AccountStatus.unauthenticated;
    }
    notifyListeners();
  }

  Future<User?> createUser(String email, String password, String name) async {
    loadUser();
    final user = await _account.create(userId: ID.unique(), email: email, name: name, password: password);

    _currentUser = user;
    _status = AccountStatus.authenticated;

    notifyListeners();
    loadUser();

    return _currentUser;
  }

  Future<void> onboardComplete() async {
    Preferences currentPrefs = await account!.getPrefs();
    currentPrefs.data["onboarding_complete"] = true;
    await account!.updatePrefs(prefs: currentPrefs.data);
  }

}