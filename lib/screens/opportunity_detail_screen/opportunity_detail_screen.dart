import 'package:flutter/material.dart';
import '/screens/opportunity_detail_screen/image_pageview.dart';
import '/screens/opportunity_detail_screen/recommend_info.dart';
import '/widgets/detail_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constants.dart';
import '/models/todo.dart';

class OpportunityDetailScreen extends StatelessWidget {
  static const routeName = '/opportunity_detail_screen';

  const OpportunityDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final oppData =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    void openSite() async {
      await launchUrl(Uri.parse('https://www.google.com/search?q=sports'));
    }

    return Scaffold(
      appBar: const DetailAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hype Sport Summer Jam',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 24.0),
                    Row(
                      children: [
                        const LeadingCircle(text: 'W'),
                        const SizedBox(width: 12.0),
                        InkWell(
                          onTap: openSite,
                          child: const Text(
                            'www.sportssummerjam.com',
                            style: TextStyle(
                                color: Colors.deepPurpleAccent,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12.0),
                    Row(
                      children: const [
                        LeadingCircle(text: 'M'),
                        SizedBox(width: 12.0),
                        Text('sportssummerjam@gmail.com'),
                      ],
                    ),
                    const SizedBox(height: 12.0),
                    Row(
                      children: const [
                        LeadingCircle(text: 'P'),
                        SizedBox(width: 12.0),
                        Text('9097962544'),
                      ],
                    ),
                    const SizedBox(height: 12.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Start Date: 01/01/2022',
                          style: TextStyle(color: Colors.green, fontSize: 14),
                        ),
                        Text(
                          'End Date: 30/12/2022',
                          style: TextStyle(color: Colors.green, fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12.0),
                    const Divider(),
                    const ImagePageView(),
                    const SizedBox(height: 12.0),
                    RichText(
                      // maxLines: 3,
                      // overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                      text: const TextSpan(
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                        children: [
                          //experimenting with multiline
                          TextSpan(
                            text:
                                """Lorem Ipsum is simply dummy text of the printing and 
                                typesetting industry. Lorem Ipsum has been the industry\'s 
                                standard dummy text ever since the 1500s, when an unknown 
                                printer took a galley of type and scrambled it to make a type specimen book.""",
                          ),
                          WidgetSpan(
                            child: SizedBox(height: 32),
                          ),
                          TextSpan(
                            text:
                                """It has survived not only five centuries, but also the leap
                                into electronic typesetting, remaining essentially unchanged.""",
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    if (oppData['tab'] == 'recommendations')
                      const RecommendInfo(),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ),
              onPressed: () {
                ToDO.addToDoList(oppData['widget']);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Added to ToDo\'s'),
                  ),
                );
              },
              child: const Text('Add to TO-DO'),
            ),
          ],
        ),
      ),
    );
  }
}

class LeadingCircle extends StatelessWidget {
  const LeadingCircle({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 12,
      backgroundColor: kPrimaryColor,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}
