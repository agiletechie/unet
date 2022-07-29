import 'package:flutter/material.dart';
import '/models/user.dart';
import '/screens/chat_detail_screen/chat_detail_screen.dart';
import '/widgets/detail_app_bar.dart';

class SearchUserScreen extends StatefulWidget {
  static const routeName = '/search_user_screen';

  const SearchUserScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchUserScreen> createState() => _SearchUserScreenState();
}

class _SearchUserScreenState extends State<SearchUserScreen> {
  var userList = User.userList;

  void searchUser(String val) {
    setState(() {
      userList = userList
          .where((element) => element.firstName.startsWith(val))
          .toList();
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      userList = User.userList;
    });
  }

  void onSelectedUser(int index) {
    setState(() {
      User.addUserChat(userList[index]);
    });
    Navigator.of(context).pushReplacementNamed(
      ChatDetailScreen.routeName,
      arguments: [
        userList[index].firstName,
        userList[index].lastName,
      ],
    );
  }

  void onSelectedGroupParticipants(int index) {
    User.addGroupParticipants(userList[index]);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final screenIdArg = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: DetailAppBar(
        bgColor: Colors.white,
        elevation: 0.2,
        title: TextField(
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
          ),
          onChanged: searchUser,
        ),
      ),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (ctx, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: screenIdArg == 'group'
                ? () {
                    onSelectedGroupParticipants(index);
                  }
                : () {
                    onSelectedUser(index);
                  },
            leading: CircleAvatar(
              child: Image.asset('assets/images/profilejpg.png'),
            ),
            title: Text(
                '${userList[index].firstName} ${userList[index].lastName}'),
          ),
        ),
      ),
    );
  }
}
