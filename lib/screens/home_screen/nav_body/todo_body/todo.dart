import 'package:flutter/material.dart';
import '/constants.dart';
import '/models/todo.dart';
import 'components/add_tab.dart';
import 'components/all_tab.dart';

class ToDo extends StatelessWidget {
  ToDo({Key? key}) : super(key: key);

  final toDoList = ToDO.geToDoList();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: const Text(
              'To-Do',
              style: TextStyle(fontSize: 20.0, color: Colors.black),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    primary: Colors.white,
                    onPrimary: kPrimaryColor,
                  ),
                  onPressed: () {},
                  child: const Icon(Icons.search),
                ),
              ),
            ],
          ),
          TabBar(
            labelColor: kPrimaryColor,
            labelStyle: const TextStyle(fontSize: 16.0),
            unselectedLabelColor: const Color(0xff000000).withOpacity(0.5),
            indicatorColor: const Color(0xff7f78e3),
            indicatorWeight: 4.0,
            isScrollable: true,
            // indicatorPadding:
            //     const EdgeInsets.symmetric(horizontal: 32.0),
            tabs: const [
              Tab(child: Icon(Icons.add_circle_outline)),
              Tab(child: Text('ALL')),
              Tab(child: Text('OPEN')),
              Tab(child: Text('IN PROGRESS')),
              Tab(child: Text('COMPLETED')),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabBarView(children: [
                AddTab(),
                AllTab(),
                Text('Hi'),
                Text('Hi'),
                Text('Hi'),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
