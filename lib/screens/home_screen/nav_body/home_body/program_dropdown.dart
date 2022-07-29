import 'package:flutter/material.dart';

class ProgramDropdown extends StatefulWidget {
  const ProgramDropdown({
    Key? key,
    required this.programSelector,
  }) : super(key: key);

  final Function(String) programSelector;

  @override
  State<ProgramDropdown> createState() => _ProgramDropdownState();
}

class _ProgramDropdownState extends State<ProgramDropdown> {
  String? dropDownValue = 'Arts';

  final programs = [
    'Arts',
    'Media and Broadcasting',
  ];

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: const Offset(0, 2.0),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: DropdownButton<String>(
          value: dropDownValue,
          items: programs
              .map((element) => DropdownMenuItem<String>(
                    value: element,
                    child: Text(
                      element,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                  ))
              .toList(),
          onChanged: (val) {
            setState(() {
              dropDownValue = val;
            });
            widget.programSelector(val!);
          },
          underline: const SizedBox.shrink(),
        ),
      ),
    );
  }
}
