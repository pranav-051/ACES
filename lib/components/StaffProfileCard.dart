import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StaffProfileCard extends StatelessWidget {
  final String name;
  final String position; // Added staff position
  final String imageAssetPath;
  final String linkedinUrl;
  final String emailUrl;

  const StaffProfileCard({
    super.key,
    required this.name,
    required this.position, // Required staff position
    required this.imageAssetPath,
    required this.linkedinUrl,
    required this.emailUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(imageAssetPath),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              name,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              position, // Display staff position
              style: const TextStyle(
                fontSize: 13,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Image(image: AssetImage("assets/linkedIn.png"), width: 30,) ,
                  color: Colors.blue,
                  onPressed: () {
                    launchURL(linkedinUrl);
                  },
                ),
                IconButton(
                  icon: const Image(image: AssetImage("assets/gmail.png"), width: 30,),
                  color: Colors.red,
                  onPressed: () {
                    launchURL(emailUrl);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> launchURL(String url) async {
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.inAppWebView,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
