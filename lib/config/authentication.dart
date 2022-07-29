import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  final BuildContext ctx;
  UserCredential? user;
  String? errorMessage;
  late ScaffoldMessengerState scaffoldMessenger = ScaffoldMessenger.of(ctx);
  // _auth.userChanges()
  Authentication({required this.ctx});

  void buildAuthenticator(
      String userName, String email, String password, bool isLogin) async {
    if (!isLogin) {
      try {
        user = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        //storing email as document Id for each user
        firestore.collection('user').doc(user?.user?.email).set({
          'username': userName,
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          errorMessage = 'Weak password';
        } else if (e.code == 'email-already-in-use') {
          errorMessage = 'Account already exists.';
        }
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text(errorMessage!),
          ),
        );
      } catch (e) {
        print(e);
      }
    } else {
      try {
        user = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          errorMessage = 'User not found';
        } else if (e.code == 'wrong-password') {
          errorMessage = 'Wrong password';
        }
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text(errorMessage.toString()),
          ),
        );
      } catch (e) {
        print(e);
      }
    }
  }
}
