import 'package:flutter/material.dart';

class OpportunityCard extends StatelessWidget {
  const OpportunityCard({
    Key? key,
    this.title = 'Hype Sport Summer Camp',
    this.description =
        'Rowing is simply dummy text of the printing and typesetting '
            'industry. Lorem Ipsum has been the industry\'s standard dummy '
            'text ever since the 1500s.',
  }) : super(key: key);

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  const Icon(Icons.rowing),
                ],
              ),
              const SizedBox(height: 12.0),
              Text(
                description,
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey.shade700,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Icon(
                    Icons.access_time,
                    size: 18.0,
                  ),
                  SizedBox(width: 8.0),
                  Text('Jan 5,2021'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
