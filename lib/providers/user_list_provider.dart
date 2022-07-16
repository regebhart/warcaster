import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warcaster/models/warcaster.dart';

import '../models/faction.dart';
import '../models/user_list.dart';

class UserListProvider with ChangeNotifier {
  late UserList _userList; //will be used to store active models for current battle

  UserList get userList => _userList;

  UserListProvider() {
    _userList = UserList(
        name: "",
        description: "",
        userList: Faction(
          name: "userlist",
          warcasters: [],
        ));
  }

  updateListName(String name) {
    _userList.name = name;
    notifyListeners();
  }

  updateDescription(String description) {
    _userList.description = description;
    notifyListeners();
  }

  addWarcaster(Warcaster warcaster) {
    _userList.userList!.warcasters!.add(warcaster);
    notifyListeners();
  }

  removeWarcaster(Warcaster warcaster) {
    _userList.userList!.warcasters!.remove(warcaster);
    notifyListeners();
  }
}
