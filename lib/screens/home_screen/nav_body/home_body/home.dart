import 'package:flutter/material.dart';
import '/constants.dart';
import '/models/program.dart';
import '/screens/home_screen/nav_body/home_body/network_card.dart';
import '/screens/home_screen/nav_body/home_body/program_dropdown.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedProgram = 'Arts';
  void onProgramSelected(value) {
    setState(() {
      selectedProgram = value;
    });
  }

  final programList = [
    Program(
      programId: 1,
      programName: 'Arts',
      startDate: '12/1/22',
      endDate: '12/2/22',
      website: 'www.rtsa.com',
      description: 'Arts is simply dummy text of the printing and '
          'typesetting industry. Lorem Ipsum has been the industry\'s '
          'standard dummy text ever since the 1500s, when an unknown '
          'printer took a galley of type and scrambled it to make a type '
          'specimen book.',
    ),
    Program(
      programId: 2,
      programName: 'Media and Broadcasting',
      startDate: '12/5/22',
      endDate: '10/6/22',
      website: 'www.mabp.com',
      description: 'Media is simply dummy text of the printing and '
          'typesetting industry. Lorem Ipsum has been the industry\'s '
          'standard dummy text ever since the 1500s, when an unknown '
          'printer took a galley of type and scrambled it to make a type '
          'specimen book.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final program = programList
        .firstWhere((element) => element.programName == selectedProgram);
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Text(
                  'Connections',
                  style: TextStyle(
                    fontSize: 20.0,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                // const SizedBox(width: 8.0),
                // ProgramDropdown(programSelector: onProgramSelected),
              ],
            ),
            // const SizedBox(height: 12.0),
            Expanded(
              child: ListView.builder(
                // scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (ctx, index) => const NetworkCard(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DateBg extends StatelessWidget {
  const DateBg({
    Key? key,
    required this.date,
  }) : super(key: key);

  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        // shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        date,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12.0,
        ),
      ),
    );
  }
}

// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// DateBg(date: 'Start Date: ${program.startDate}'),
// DateBg(date: 'End Date: ${program.endDate}'),
// ],
// ),
// const SizedBox(height: 24.0),
// Text(
// 'website: ${program.website}',
// style: const TextStyle(
// fontSize: 14.0,
// color: Colors.black54,
// ),
// ),
// const SizedBox(height: 24.0),
// const Text(
// 'Description',
// style: TextStyle(fontSize: 16.0),
// ),
// const SizedBox(height: 12.0),
// RichText(
// textAlign: TextAlign.justify,
// text: TextSpan(
// text: program.description!,
// style: const TextStyle(
// color: Colors.black54,
// ),
// ),
// ),
