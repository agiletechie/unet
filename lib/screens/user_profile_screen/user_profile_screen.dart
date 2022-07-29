import 'package:flutter/material.dart';
import '/constants.dart';
import '/models/user.dart';
import '/screens/user_profile_screen/components/experience_card.dart';
import '/widgets/detail_app_bar.dart';

class UserProfileScreen extends StatelessWidget {
  static const routeName = '/user_profile_screen';

  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userList = User.userList;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const DetailAppBar(
        title: Text('James Smith'),
        bgColor: Colors.transparent,
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 40.0,
                backgroundImage: AssetImage('assets/images/profilejpg.png'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    userList[0].firstName,
                    style: const TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    userList[0].lastName,
                    style: const TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(height: 4.0),
              Text(
                userList[0].contact,
                style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500),
              ),
              // const SizedBox(height: 4.0),
              Text(
                userList[0].email,
                style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8.0),
              Text(userList[0].addressLine1),
              Text(userList[0].addressLine2.toString()),
              const SizedBox(height: 24.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: size.width * 0.75,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ImageIcon(
                          AssetImage('assets/images/graduate-cap.png'),
                          color: Colors.white,
                        ),
                        const SizedBox(width: 16.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Dallas Institute',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              'Computer Science',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 14.0),
                            ),
                            Text(
                              'Grade 2, DLI40123',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 14.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Experiences',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 12.0),
              SizedBox(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: userList[0].experience?.length,
                  itemBuilder: (ctx, index) => ExperienceCard(
                    experience: userList[0].experience![index],
                  ),
                ),
              ),
              const SizedBox(height: 12.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Interests',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 12.0),
              SizedBox(
                height: 65,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: userList[0].interests.length,
                  itemBuilder: (ctx, index) => Card(
                    margin: const EdgeInsets.all(8.0),
                    color: kPrimaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        userList[0].interests[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Skills',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 12.0),
              SizedBox(
                height: 65,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: userList[0].skills.length,
                  itemBuilder: (ctx, index) => Card(
                    margin: const EdgeInsets.all(8.0),
                    color: kPrimaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        userList[0].skills[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
