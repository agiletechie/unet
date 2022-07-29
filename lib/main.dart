import 'package:flutter/material.dart';
import 'barrel_screen.dart';
import 'constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // elevatedButtonTheme: ElevatedButtonThemeData(
        //     style: ElevatedButton.styleFrom(primary: const Color(0xff7f78e3))),
        colorScheme: ColorScheme.fromSeed(
            seedColor: kPrimaryColor, secondary: Colors.amber),
        // textTheme: TextTheme(
        //   bodyText1: TextStyle(fontSize: 10.0),
        // ),
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            return const HomeScreen();
          }
          return const SSOScreen();
        },
      ),
      routes: {
        AddGroupScreen.routeName: (ctx) => const AddGroupScreen(),
        ChatDetailScreen.routeName: (ctx) => const ChatDetailScreen(),
        HomeScreen.routeName: (ctx) => const HomeScreen(),
        OpportunityDetailScreen.routeName: (ctx) =>
            const OpportunityDetailScreen(),
        SearchUserScreen.routeName: (ctx) => const SearchUserScreen(),
        UserProfileScreen.routeName: (ctx) => const UserProfileScreen(),
      },
    );
  }
}
