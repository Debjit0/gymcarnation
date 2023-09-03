import 'package:flutter/material.dart';
import '../models/user.dart';

class UserProvider with ChangeNotifier {
  User? _user;

  get user => _user;

  set setUser(value) => _user = value;
}
