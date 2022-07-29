import 'package:flutter/material.dart';

class RecommendInfo extends StatefulWidget {
  const RecommendInfo({Key? key}) : super(key: key);

  @override
  State<RecommendInfo> createState() => _RecommendInfoState();
}

class _RecommendInfoState extends State<RecommendInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recommended by',
          style: TextStyle(
              color: Colors.grey.shade500,
              decoration: TextDecoration.underline),
        ),
        ListTile(
          leading: CircleAvatar(
            child: Image.asset('assets/images/teacher.png'),
          ),
          title: const Text('Chandler M. Bing'),
          subtitle: const Text('Advisor'),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: Colors.red.shade900,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
          ),
          child: const Text('Dismiss Recommendation'),
        ),
      ],
    );
  }
}
