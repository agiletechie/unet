import 'package:flutter/material.dart';

class NetworkCard extends StatelessWidget {
  const NetworkCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: const [
              CircleAvatar(
                radius: 32.0,
                backgroundImage: AssetImage('assets/images/profilejpg.png'),
              ),
              SizedBox(height: 16.0),
              Text(
                'Shubham',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              Text(
                'Student',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Color(0xff7f78e3),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
