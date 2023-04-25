// ignore_for_file: unused_local_variable

import 'package:flutter/foundation.dart';
import 'package:perfect_app_delivery/models/user.dart';
import 'package:perfect_app_delivery/resources/auth_method.dart';

class UserProvider extends ChangeNotifier {
  Users? _users;
  final AuthMethod _authMethod = AuthMethod();

  Users get getUser => _users!;
  Future<void> refreshUser() async {
    Users users = await _authMethod.getUserDetials();
    _users = users;
    notifyListeners();
  }
}
