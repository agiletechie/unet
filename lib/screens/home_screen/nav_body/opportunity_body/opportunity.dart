import 'package:flutter/material.dart';
import '/barrel_screen.dart';
import '/constants.dart';
import '/screens/home_screen/nav_body/opportunity_body/opportunity_card.dart';
import 'filters.dart';

class Opportunity extends StatelessWidget {
  const Opportunity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TabBar(
              labelColor: kPrimaryColor,
              labelStyle: const TextStyle(fontSize: 18.0),
              unselectedLabelColor: const Color(0xff000000).withOpacity(0.5),
              indicatorColor: kPrimaryColor,
              indicatorWeight: 4.0,
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              tabs: const [
                Tab(child: Text('Opportunities')),
                Tab(text: 'Recommendations'),
              ],
            ),
            Filters(),
            Expanded(
              child: TabBarView(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: TextField(
                          maxLength: 20,
                          decoration: InputDecoration(
                            counter: const SizedBox.shrink(),
                            // constraints: BoxConstraints(maxHeight: 56),
                            hintText: 'Search...',
                            suffixIcon: const Icon(Icons.search),
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                            isDense: true,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 4,
                          itemBuilder: (ctx, index) => GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  OpportunityDetailScreen.routeName,
                                  arguments: {
                                    'tab': 'opportunities',
                                    'widget': const OpportunityCard(),
                                  });
                            },
                            child: const OpportunityCard(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Recommendation TabData
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: TextField(
                          maxLength: 20,
                          decoration: InputDecoration(
                            counter: const SizedBox.shrink(),
                            // constraints: BoxConstraints(maxHeight: 56),
                            hintText: 'Search...',
                            suffixIcon: const Icon(Icons.search),
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                            isDense: true,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 4,
                          itemBuilder: (ctx, index) => GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  OpportunityDetailScreen.routeName,
                                  arguments: {
                                    'tab': 'recommendations',
                                    'widget': const OpportunityCard(),
                                  });
                            },
                            child: const OpportunityCard(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
