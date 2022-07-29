import 'dart:collection';

import './user.dart';

class Group {
  int id;
  String groupName;
  List<User> participants;

  Group({
    required this.id,
    required this.groupName,
    required this.participants,
  });

  static List<Group> _groupsList = [];

  static List<Group> getGroupList() {
    return UnmodifiableListView(_groupsList);
  }

  static void addGroup(Group group) {
    _groupsList.add(group);
  }
}
