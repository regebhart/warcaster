import 'faction.dart';

class UserList {
  String name;
  String description;
  Faction? userList;

  UserList({
    required this.name,
    required this.description,
    this.userList,
  });
}
