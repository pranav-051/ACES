import 'package:aces/SidebarNavPages/main_left_panel.dart';
import 'package:aces/components/text.dart';
import 'package:aces/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key, required this.title});
  final String title;

  @override
  State<Page2> createState() => _Page2();
}

class _Page2 extends State<Page2> {
  Map<int, bool> expandedStates = {};

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: const NavDrawer(),
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white, size: 30),
            title: const Row(
              children: [
                CustomText(
                  text: 'Events',
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  textColor: Colors.white,
                ),
              ],
            ),
            bottom: const TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  icon: Icon(Icons.code, color: Colors.white),
                  child: CustomText(
                    text: 'Tech Events',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    textColor: Colors.white,
                  ),
                ),
                Tab(
                  icon: Icon(Icons.code_off, color: Colors.white),
                  child: CustomText(
                    text: 'Non-Tech Events',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              _buildEventList('Tech'),
              _buildEventList('Non-Tech'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEventList(String type) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('events')
          .where('type', isEqualTo: type)
          .orderBy('timestamp', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
              style: const TextStyle(color: Colors.black),
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text(
              'No relevant data',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          );
        }

        final events = snapshot.data!.docs;

        return ListView.builder(
          itemCount: events.length,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          itemBuilder: (context, index) {
            final event = events[index].data() as Map<String, dynamic>;
            final eventName = event['eventname'] ?? 'Event Name';
            final description = event['description'] ?? 'Description';
            final mode = event['mode'] ?? 'Online';
            final time = event['time'] ?? 'N/A';
            final date = event['date'] ?? 'N/A';
            final registrationLink = event['registrationLink'] ?? '';

            return Container(
              child: Card(
                elevation: 5,
                color: AppColors.lightGray2,
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Event Name
                      Text(
                        eventName,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Event Description
                      Text(
                        description,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Date and Time in the same line
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            size: 16,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            date,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(width: 20),
                          const Icon(
                            Icons.access_time,
                            size: 16,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            time,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      // Mode and Registration Link in the same line
                      Row(
                        children: [
                          // Mode
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              mode,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),

                          // Registration Link
                          if (registrationLink.isNotEmpty)
                            InkWell(
                              onTap: () {
                                _launchURL(registrationLink);
                              },
                              child: Text(
                                'Register Now',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.blue[800],
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}