import 'package:flutter/material.dart';

class DetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DetailAppBar({
    Key? key,
    this.title = const SizedBox.shrink(),
    this.bgColor = Colors.transparent,
    this.elevation = 0,
  }) : super(key: key);

  final Widget title;
  final Color bgColor;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: title,
      foregroundColor: Colors.black87,
      backgroundColor: bgColor,
      elevation: elevation,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
