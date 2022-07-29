import 'package:flutter/material.dart';
import 'input_field.dart';
import 'username_field.dart';
import '/config/authentication.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  var isLogin = true;
  String userName = '';
  String email = '';
  String password = '';
  final _formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authentication = Authentication(ctx: context);
    return Form(
      key: _formState,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Welcome',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 12.0),
            // if (!isLogin)
            !isLogin
                ? UserNameField(
                    onSaved: (value) {
                      userName = value!;
                    },
                  )
                : const SizedBox.shrink(),
            const SizedBox(height: 16.0),
            InputField(
              hintText: 'Please enter your email',
              onSaved: (value) {
                email = value!;
              },
            ),
            const SizedBox(height: 16.0),
            InputField(
              hintText: 'Enter your password',
              obscureText: true,
              onSaved: (value) {
                password = value!;
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                bool isValid = _formState.currentState!.validate();
                if (isValid) {
                  _formState.currentState!.save();
                  // call authenticator
                  authentication.buildAuthenticator(
                    userName,
                    email,
                    password,
                    isLogin,
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  isLogin ? 'SIGN IN' : 'SIGN UP',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  isLogin ? 'Don\'t have an account ?' : 'Have an account ?',
                  style: const TextStyle(
                    color: Color(0xff8f9bb3),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
                  child: Text(
                    isLogin ? 'Sign Up' : 'Sign In',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
