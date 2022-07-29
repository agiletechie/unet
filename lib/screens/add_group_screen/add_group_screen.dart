import 'package:flutter/material.dart';
import '../search_user_screen/search_user_screen.dart';
import '/models/user.dart';
import '/models/group.dart';

class AddGroupScreen extends StatefulWidget {
  static const routeName = '/add_group_screen';

  const AddGroupScreen({Key? key}) : super(key: key);

  @override
  State<AddGroupScreen> createState() => _AddGroupScreenState();
}

class _AddGroupScreenState extends State<AddGroupScreen> {
  String groupName = '';
  Set<User> groupParticipants = User.getParticipants();
  final _groupNameController = TextEditingController();

  @override
  void dispose() {
    _groupNameController.dispose();
    super.dispose();
  }

  void makeGroup() {
    if (groupName == '' || groupParticipants.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Enter name and participants'),
        ),
      );
    } else {
      Group.addGroup(
        Group(
          id: 1,
          groupName: groupName,
          participants: groupParticipants.toList(),
        ),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.scheduleFrameCallback((_) {
      setState(() {});
    });
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('New Group'),
        foregroundColor: Colors.black87,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _groupNameController,
              decoration: const InputDecoration(
                hintText: 'Group Name...',
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff7f78e3))),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff7f78e3))),
              ),
              maxLength: 30,
              onChanged: (val) {
                groupName = val;
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  SearchUserScreen.routeName,
                  arguments: 'group',
                );
              },
              child: const Text('Add Participants'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: groupParticipants.length,
                itemBuilder: (ctx, index) => ListTile(
                  leading: CircleAvatar(
                    child: Image.asset('assets/images/profilejpg.png'),
                  ),
                  title: Text(
                      '${groupParticipants.elementAt(index).firstName} ${groupParticipants.elementAt(index).lastName}'),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: makeGroup,
        backgroundColor: Colors.amber,
        elevation: 4.0,
        child: const Icon(Icons.done, size: 32.0),
      ),
    );
  }
}
