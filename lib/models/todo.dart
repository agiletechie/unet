import 'dart:collection';
import '../screens/home_screen/nav_body/opportunity_body/opportunity_card.dart';

class ToDO {
  static final List<OpportunityCard> _toDoList = [];

  static List<OpportunityCard> geToDoList() {
    return UnmodifiableListView(_toDoList);
  }

  static void addToDoList(OpportunityCard oppCard) {
    _toDoList.add(oppCard);
  }
}
