import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../components/text.dart';

class notifpullpage extends StatefulWidget {
  const notifpullpage({super.key});
  @override
  State<notifpullpage> createState() => _notifpullpageState();
}

class _notifpullpageState extends State<notifpullpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black, size: 30),
          title: const Row(
            children: [
              CustomText(
                text: 'Notifications',
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('notifications')
              .orderBy('timestamp', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text(
                  'No notifications available',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final notifications = snapshot.data!.docs;

            return ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                DateTime date = notification['timestamp'].toDate();

                return GestureDetector(
                  onTap: () {
                    if (notification['title'] != null &&
                        notification['description'] != null &&
                        notification['name_of_mod'] != null &&
                        notification['link'] != null &&
                        notification['img_url'] != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => notifdeetspage(
                            title: notification['title'] ?? '',
                            description: notification['description'] ?? '',
                            name_of_mod: notification['name_of_mod'] ?? '',
                            link: notification['link'] ?? '',
                            date: date,
                            imgurl: notification['img_url'] ?? '',
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Notification data is incomplete')),
                      );
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(
                        vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF003366), Color(0xFF001F54)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Row(
                      children: [
                        if (notification['img_url'] != null &&
                            notification['img_url'].isNotEmpty)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              notification['img_url'],
                              height: 60,
                              width: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                notification['title'],
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                date.toLocal().toString().split(' ')[0],
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}

class notifdeetspage extends StatelessWidget {
  final String title;
  final String description;
  final String name_of_mod;
  final String link;
  final DateTime date;
  final String imgurl;

  notifdeetspage(
      {required this.name_of_mod,
        required this.title,
        required this.description,
        required this.link,
        required this.date,
        required this.imgurl});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (imgurl.isNotEmpty)
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imgurl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 27,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              "Date: ${date.toLocal().toString().split(' ')[0]}",
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                if (link.isNotEmpty) {
                  _launchUrl(link);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('No valid link provided')),
                  );
                }
              },
              child: Text(
                link.isNotEmpty ? link : 'No Link Available',
                style: const TextStyle(
                    color: Colors.blue, decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
