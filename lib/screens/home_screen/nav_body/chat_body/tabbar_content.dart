import 'package:flutter/material.dart';
import '/models/group.dart';
import '/models/user.dart';
import '/screens/add_group_screen/add_group_screen.dart';
import '/screens/chat_detail_screen/chat_detail_screen.dart';
import 'msg_card.dart';

class TabbarContent extends StatefulWidget {
  const TabbarContent({
    Key? key,
  }) : super(key: key);

  @override
  State<TabbarContent> createState() => _TabbarContentState();
}

class _TabbarContentState extends State<TabbarContent> {
  Set<User> userChatSet = User.getUserChatSet();
  List<Group> groupList = Group.getGroupList();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.scheduleFrameCallback((_) {
      setState(() {});
    });
    return Expanded(
      child: TabBarView(
        children: [
          userChatSet.isEmpty
              ? const Center(child: Text('No Chats'))
              : ListView.builder(
                  itemCount: userChatSet.length,
                  itemBuilder: (ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          ChatDetailScreen.routeName,
                          arguments: [
                            userChatSet.elementAt(index).firstName,
                            userChatSet.elementAt(index).lastName,
                          ],
                        );
                      },
                      child: MsgCard(
                        firstName: userChatSet.elementAt(index).firstName,
                        lastName: userChatSet.elementAt(index).lastName,
                      ),
                    );
                  },
                ),
          Stack(
            children: [
              groupList.isEmpty
                  ? const Center(child: Text('No Groups'))
                  : ListView.builder(
                      itemCount: groupList.length,
                      itemBuilder: (ctx, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              ChatDetailScreen.routeName,
                              arguments: [
                                groupList[index].groupName,
                                '',
                              ],
                            );
                          },
                          child: MsgCard(
                            firstName: groupList[index].groupName,
                            lastName: '',
                          ),
                        );
                      },
                    ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton.small(
                  onPressed: () {
                    User.removeAllParticipants();
                    Navigator.of(context).pushNamed(AddGroupScreen.routeName);
                  },
                  elevation: 4.0,
                  child: const ImageIcon(
                    AssetImage('assets/images/add.png'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
