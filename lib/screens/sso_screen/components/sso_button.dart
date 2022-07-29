import 'package:flutter/material.dart';
import '/screens/home_screen/home_screen.dart';

class SSOButton extends StatelessWidget {
  const SSOButton({
    Key? key,
    required this.logo,
  }) : super(key: key);

  final String logo;
  void goHome(BuildContext context) {
    Navigator.of(context).pushNamed(HomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () {
        goHome(context);
      },
      child: CircleAvatar(
        radius: 28.0,
        backgroundColor: Colors.black,
        child: CircleAvatar(
          radius: 27.0,
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              logo,
            ),
          ),
        ),
      ),
    );
  }
}
