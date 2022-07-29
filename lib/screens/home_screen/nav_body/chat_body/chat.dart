import 'package:flutter/material.dart';
import '/constants.dart';
import '/screens/search_user_screen/search_user_screen.dart';
import './tabbar_content.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SizedBox(
        width: double.maxFinite,
        // height: MediaQuery.of(context).size.height * 0.5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Messages',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        SearchUserScreen.routeName,
                        arguments: 'single',
                      );
                    },
                    icon: const Icon(Icons.search),
                  ),
                ],
              ),
              TabBar(
                labelColor: kPrimaryColor,
                labelStyle: const TextStyle(fontSize: 16.0),
                unselectedLabelColor: const Color(0xff000000).withOpacity(0.5),
                indicatorColor: const Color(0xff7f78e3),
                indicatorWeight: 4.0,
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 32.0),
                tabs: const [
                  Tab(
                      child: Text(
                    'One-on-One',
                  )),
                  Tab(
                    child: Text(
                      'Group',
                    ),
                  ),
                ],
              ),
              const TabbarContent(),
            ],
          ),
        ),
      ),
    );
  }
}
