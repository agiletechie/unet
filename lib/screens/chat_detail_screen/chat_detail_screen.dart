import 'package:flutter/material.dart';
import '/constants.dart';
import '/widgets/detail_app_bar.dart';

class ChatDetailScreen extends StatelessWidget {
  static const routeName = '/chat_detail_screen';

  const ChatDetailScreen({
    Key? key,
  }) : super(key: key);

  final messages = const [
    MessageBg(
      message: 'Can you tell me a bit about you?',
      isMe: false,
    ),
    MessageBg(
      message: 'I am lorem ipsum dolor ipsum dolor '
          'lorem merol muspi rolod iameom. lorem '
          'ipsumdolor ipsum dolor lorem merol muspi rolod.'
          'lorem ipsum dolor.',
      isMe: true,
    ),
    MessageBg(
      message: 'Would you like to let others know how they can '
          'find you on the web? (LinkedIn, GitHub, etc...)',
      isMe: false,
    ),
    MessageBg(
      message: 'Can you tell me a bit about you?',
      isMe: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final nameArgs = ModalRoute.of(context)?.settings.arguments as List<String>;
    return Scaffold(
      appBar: DetailAppBar(
        title: Text('${nameArgs[0]} ${nameArgs[1]}'),
        bgColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (ctx, index) => messages[index]),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter Message...',
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12.0),
                CircleAvatar(
                    backgroundColor: kPrimaryColor,
                    radius: 24.0,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.send),
                      color: Colors.white,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MessageBg extends StatelessWidget {
  const MessageBg({
    Key? key,
    required this.message,
    required this.isMe,
  }) : super(key: key);

  final String message;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isMe ? const Color(0xffEDE3FA) : const Color(0xffC7A9F1),
            borderRadius: BorderRadius.circular(12.0),
          ),
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
          padding: const EdgeInsets.all(12.0),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: Text(
            message,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
