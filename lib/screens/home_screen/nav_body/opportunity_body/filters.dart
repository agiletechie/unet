import 'package:flutter/material.dart';

import '../../../../constants.dart';

class Filters extends StatefulWidget {
  const Filters({Key? key}) : super(key: key);

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  final buttons = [
    {'icon': Icons.rowing, 'label': 'SPORTS', 'isTapped': true},
    {'icon': Icons.color_lens, 'label': 'PAINT', 'isTapped': false},
    {'icon': Icons.music_note, 'label': 'MUSIC', 'isTapped': false},
    {'icon': Icons.school, 'label': 'ACADEMIC', 'isTapped': false},
  ];

  void onButtonTapped(int index, bool isTapped) {
    print(index);
    print(isTapped);
    for (var i = 0; i < buttons.length; i++) {
      setState(() {
        if (i == index) {
          buttons[i]['isTapped'] = true;
        } else {
          buttons[i]['isTapped'] = false;
        }
      });
    }
    // for (var button in buttons) {
    //   if (button['isTapped'] as bool) {
    //     button['isTapped'] = false;
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          buttons.length,
          (index) => buttons[index]['isTapped'] as bool
              ? Expanded(
                  child: AnimatedButton(
                    index: index,
                    isTapped: buttons[index]['isTapped'] as bool,
                    onTapped: onButtonTapped,
                    label: buttons[index]['label'] as String,
                    icon: buttons[index]['icon'] as IconData,
                  ),
                )
              : AnimatedButton(
                  index: index,
                  isTapped: buttons[index]['isTapped'] as bool,
                  onTapped: onButtonTapped,
                  label: buttons[index]['label'] as String,
                  icon: buttons[index]['icon'] as IconData,
                ),
        ),
      ],
    );
  }
}

class AnimatedButton extends StatelessWidget {
  const AnimatedButton({
    Key? key,
    required this.index,
    required this.label,
    required this.icon,
    required this.isTapped,
    required this.onTapped,
  }) : super(key: key);

  final int index;
  final IconData icon;
  final String label;
  final bool isTapped;
  final Function(int, bool) onTapped;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: isTapped ? StadiumBorder() : CircleBorder(),
        primary: Colors.white,
        onPrimary: kPrimaryColor,
      ),
      onPressed: () {
        onTapped(index, isTapped);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          if (isTapped)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(label),
            ),
        ],
      ),
    );
  }
}
