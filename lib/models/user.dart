import 'dart:collection';

import 'experience.dart';

class User {
  int userId;
  String firstName;
  String lastName;
  String contact;
  String email;
  String addressLine1;
  String? addressLine2;
  List<String> interests;
  List<String> skills;
  List<Experience>? experience;
  String socialLink;

  User({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.contact,
    required this.email,
    required this.addressLine1,
    this.addressLine2,
    required this.interests,
    required this.skills,
    this.experience,
    required this.socialLink,
  });

  static final userList = [
    User(
      userId: 1,
      firstName: 'James',
      lastName: 'Smith',
      contact: '9097962544',
      email: 'james@gmail.com',
      addressLine1: '1991 Elm Drive,New York',
      addressLine2: 'New York,USA',
      interests: ['Music', 'Tennis', 'Painting'],
      skills: ['Spring Boot', 'Java'],
      experience: [
        Experience(
          organization: 'TCS',
          startDate: '1/07/22',
          endDate: 'Present',
          role: 'Full Stack Developer',
        ),
        Experience(
          organization: 'Wipro',
          startDate: '1/01/21',
          endDate: '1/06/22',
          role: 'Backend Developer',
        ),
        Experience(
          organization: 'Infosys',
          startDate: '1/07/20',
          endDate: '30/12/21',
          role: 'Frontend Developer',
        ),
      ],
      socialLink: 'github.com/james',
    ),
    User(
      userId: 2,
      firstName: 'Ron',
      lastName: 'Dsouza',
      contact: '9097962544',
      email: 'ron@gmail.com',
      addressLine1: '1579 North Avenue,Omaha',
      addressLine2: 'Nebraska,USA',
      interests: ['Music', 'Cricket', 'Painting'],
      skills: ['Django', 'Python'],
      experience: [
        Experience(
          organization: 'TCS',
          startDate: '1/07/22',
          endDate: 'Present',
          role: 'Full Stack Developer',
        ),
        Experience(
          organization: 'Wipro',
          startDate: '1/01/21',
          endDate: '1/06/22',
          role: 'Backend Developer',
        ),
      ],
      socialLink: 'github.com/ron',
    ),
    User(
      userId: 3,
      firstName: 'Robert',
      lastName: 'Pattinson',
      contact: '9097962588',
      email: 'robert@gmail.com',
      addressLine1: '2122 South Street,Midland',
      addressLine2: 'Texas,USA',
      interests: ['Swimming', 'Footbll', 'Painting'],
      skills: ['Flask', 'Python'],
      experience: [
        Experience(
          organization: 'TCS',
          startDate: '1/07/22',
          endDate: 'Present',
          role: 'Full Stack Developer',
        ),
        Experience(
          organization: 'Wipro',
          startDate: '1/01/21',
          endDate: '1/06/22',
          role: 'Backend Developer',
        ),
      ],
      socialLink: 'github.com/robert',
    ),
  ];

  static final Set<User> _userChatSet = {};

  static Set<User> getUserChatSet() {
    return UnmodifiableSetView(_userChatSet);
  }

  static void addUserChat(User user) {
    _userChatSet.add(user);
  }

  static Set<User> _groupParticipants = {};

  static Set<User> getParticipants() {
    return UnmodifiableSetView(_groupParticipants);
  }

  static void addGroupParticipants(User user) {
    _groupParticipants.add(user);
  }

  static void removeAllParticipants() {
    _groupParticipants = {};
  }
}
