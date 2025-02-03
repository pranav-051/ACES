import 'package:aces/components/text.dart';
import 'package:aces/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:aces/components/user_profile_card.dart';

class UserProfileGrid extends StatelessWidget {
  const UserProfileGrid({super.key});
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> users = [
      {
        'name': 'Pranav Sherekar',
        'imageAssetPath': 'assets/pranav.png ',
        'linkedin': 'https://linkedin.com/in/johndoe',
        'email': 'mailto:pranavsherekacom.com',
        'github': 'https://github.com/pranav-051',
      },
      {
        'name': 'Pratik Limbekar',
        'imageAssetPath': 'https://via.placeholder.com/150',
        'linkedin': 'https://www.linkedin.com/in/pranav-sherekar-22695b244/',
        'email': 'mailto:janesmith@example.com',
        'github': 'https://github.com/janesmith',
      },
      {
        'name': 'Mansi Gaikwad',
        'imageAssetPath': 'https://via.placeholder.com/150',
        'linkedin': 'https://linkedin.com/in/johndoe',
        'email': 'mailto:johndoe@example.com',
        'github': 'https://github.com/johndoe',
      },
      {
        'name': 'Bhoomi Narag',
        'imageAssetPath': 'https://via.placeholder.com/150',
        'linkedin': 'https://linkedin.com/in/janesmith',
        'email': 'mailto:janesmith@example.com',
        'github': 'https://github.com/janesmith',
      },
      // Add more users here
    ];

    return Scaffold(
      appBar:AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Row(
          children: [
            CustomText(
              text: 'Developers',
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 50),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];

            return UserProfileCard(
              name: user['name']!,
              linkedinUrl: user['linkedin']!,
              emailUrl: user['email']!,
              githubUrl: user['github']!,
              imageAssetPath: "",
            );
          },
        ),
      ),
    );
  }
}
