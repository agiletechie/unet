import 'package:flutter/material.dart';
import 'components/auth_form.dart';
import '/screens/sso_screen/components/sso_button.dart';

class SSOScreen extends StatelessWidget {
  static const routeName = '/';

  const SSOScreen({Key? key}) : super(key: key);

  final List<String> logos = const [
    'assets/images/facebook.png',
    'assets/images/instagram.png',
    'assets/images/google.png',
    // 'assets/images/linkedin.png',
    // 'assets/images/apple.png',
    // 'assets/images/windows.png',
    // 'assets/images/yahoo.png',
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedLogo(size: size),
                  const SizedBox(height: 12.0),
                  const Text(
                    'U-NET',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  SizedBox(height: 12.0),
                  AuthForm(),
                  SizedBox(height: 24.0),
                  Wrap(
                    spacing: size.width * 0.1,
                    // spacing: 32.0,
                    // runSpacing: 32.0,
                    children: [
                      ...List.generate(
                        logos.length,
                        (index) => SSOButton(
                          logo: logos[index],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({Key? key, required this.size}) : super(key: key);

  final Size size;
  @override
  State<AnimatedLogo> createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo> {
  double widthRatio = 0.01;

  @override
  initState() {
    super.initState();
    widthRatio = 0.25;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 800),
      child: Image.asset(
        'assets/images/unet-icon.png',
        width: widget.size.width * widthRatio,
      ),
    );
  }
}
