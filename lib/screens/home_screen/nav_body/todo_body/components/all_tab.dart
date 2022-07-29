import 'package:flutter/material.dart';

import '../../../../../models/todo.dart';

class AllTab extends StatelessWidget {
  AllTab({Key? key}) : super(key: key);
  final toDoList = ToDO.geToDoList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        toDoList.isEmpty
            ? const Expanded(
                child: Center(child: Text('Add ToDo\'s from Opportunity')))
            : Expanded(
                child: ListView.builder(
                  itemCount: toDoList.length,
                  itemBuilder: (ctx, index) => toDoList[index],
                ),
              ),
      ],
    );
  }
}
