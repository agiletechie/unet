import 'package:flutter/material.dart';

class ImagePageView extends StatefulWidget {
  const ImagePageView({Key? key}) : super(key: key);

  @override
  State<ImagePageView> createState() => _ImagePageViewState();
}

class _ImagePageViewState extends State<ImagePageView> {
  late final PageController _pageController;

  final imageList = [
    'assets/images/sports-image1.jpg',
    'assets/images/sports-image2.jpg',
    'assets/images/sports-image3.jpg',
  ];

  @override
  initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: PageView.builder(
          controller: _pageController,
          itemCount: imageList.length,
          pageSnapping: true,
          itemBuilder: (ctx, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Image.asset(
                  imageList[index],
                  fit: BoxFit.cover,
                ),
              )),
    );
  }
}
