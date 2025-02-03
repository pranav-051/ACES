import 'package:aces/userHome/bottomNavBar/main_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../components/text.dart';

class NewsletterScreen extends StatelessWidget {
  final List<Newsletter> newsletters = [
    Newsletter(
      imageUrl: 'assets/imag2.jpg',
      title: 'Blockchain: The Security Future',
      description: 'In an increasingly digital world, security is paramount. As data breaches and cyber threats become more...',
      publishDate: 'May 2023',
      newsletterUrl: "https://drive.google.com/file/d/1jZm8wrHqyNDlTsPR5kGykt5Flh3JeAyA/view?usp=sharing",
    ),
    Newsletter(
      imageUrl: 'assets/imag3.jpg',
      title: 'Data Structures: Beyond the Books',
      description: 'Understanding the real-world applications of data structures is crucial for tech enthusiasts for seve...',
      publishDate: 'Oct 2023',
      newsletterUrl: "https://drive.google.com/file/d/1NvaaXUxfgmetofnI73sOIgmn-wKvf9pX/view?usp=sharing",
    ),
    // Add more newsletters here
  ];

  NewsletterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const mainBottomNav(title: "MAIN BOTTOM NAV")),
              );
            },
          ),
          title: const CustomText(
            text: "Newsletter",
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          )),
      body: ListView.builder(
        itemCount: newsletters.length,
        itemBuilder: (context, index) {
          return NewsletterCard(newsletter: newsletters[index]);
        },
      ),
    );
  }
}

class NewsletterCard extends StatelessWidget {
  final Newsletter newsletter;

  const NewsletterCard({super.key, required this.newsletter});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image(
                    image: AssetImage(newsletter.imageUrl),
                    width: 100,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        newsletter.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        newsletter.description,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Published on: ${newsletter.publishDate}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 10,)
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
               ElevatedButton(
                  onPressed: () {
                    launchURL(
                       newsletter.newsletterUrl
                    );
                  },
                  child: const Text('Read More'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Newsletter {
  final String imageUrl;
  final String title;
  final String description;
  final String publishDate;
  final String newsletterUrl;

  Newsletter({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.publishDate,
    required this.newsletterUrl
  });
}

Future<void> launchURL(String url) async {
  final Uri uri = Uri.parse(url);

  if (await canLaunchUrl(uri)) {
    await launchUrl(
      uri,
      // mode: LaunchMode.inAppWebView, // Opens the URL in an in-app browser
    );
  } else {
    throw 'Could not launch $url';
  }
}
