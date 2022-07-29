import 'package:flutter/material.dart';
import '/screens/user_profile_screen/user_profile_screen.dart';
import 'nav_body/barrel_nav_body.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void onItemTapped(val) {
    setState(() {
      _selectedIndex = val;
    });
  }

  final navScreen = [
    Home(),
    ToDo(),
    Opportunity(),
    Chat(),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/unet-icon.png',
          ),
        ),
        title: const Text(
          'Unet',
          style: TextStyle(color: Colors.black87),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black87,
        elevation: 0,
        // toolbarHeight: size.height * 0.15,
        actions: [
          // GestureDetector(
          //   onTap: () {
          //     Navigator.of(context).pushNamed(UserProfileScreen.routeName);
          //   },
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
          //     child: CircleAvatar(
          //       // radius: 24.0,
          //       child: Image.asset('assets/images/profilejpg.png'),
          //     ),
          //   ),
          // ),
          PopupMenuButton(
            itemBuilder: (ctx) {
              return [
                PopupMenuItem(
                  value: 'logout',
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                  },
                  child: const Text('Logout'),
                )
              ];
            },
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: navScreen[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/home.png'),
            ),
            label: 'Home',
            backgroundColor: Colors.black87,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/todo.png'),
            ),
            label: 'Todo',
            backgroundColor: Colors.black87,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/opportunity.png'),
            ),
            label: 'Opportunity',
            backgroundColor: Colors.black87,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/chat.png'),
            ),
            label: 'Chat',
            backgroundColor: Colors.black87,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }
}
