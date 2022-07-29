import 'package:flutter/material.dart';
import '/constants.dart';
import '/models/experience.dart';

class ExperienceCard extends StatelessWidget {
  const ExperienceCard({
    Key? key,
    required this.experience,
  }) : super(key: key);

  final Experience experience;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      color: kPrimaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              experience.organization!,
              style: const TextStyle(color: Colors.white, fontSize: 18.0),
            ),
            const SizedBox(height: 12.0),
            Text(
              experience.role!,
              style: const TextStyle(color: Colors.white70, fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              '${experience.startDate}-${experience.endDate}',
              style: const TextStyle(color: Colors.white70, fontSize: 14.0),
            ),
          ],
        ),
      ),
    );
  }
}
