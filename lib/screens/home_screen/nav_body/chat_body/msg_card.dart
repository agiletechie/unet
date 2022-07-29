import 'package:flutter/material.dart';
import '/constants.dart';

class MsgCard extends StatelessWidget {
  const MsgCard({
    Key? key,
    required this.firstName,
    required this.lastName,
  }) : super(key: key);

  final String firstName;
  final String lastName;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text('11:30'),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 32.0,
                  backgroundImage: AssetImage('assets/images/profilejpg.png'),
                ),
                const SizedBox(width: 24.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$firstName $lastName',
                      style: const TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4.0),
                    const Text(
                      'Student',
                      style:
                          TextStyle(fontSize: 16.0, color: Color(0xff7f78e3)),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      'I needed help with my studies.',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: const Color(0xff000000).withOpacity(0.5)),
                    ),
                  ],
                ),
              ],
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: kPrimaryColor,
                shape: BoxShape.circle,
                border: Border.all(width: 2),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  '1',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
