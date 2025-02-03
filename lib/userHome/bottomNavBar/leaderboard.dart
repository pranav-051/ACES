import 'package:aces/SidebarNavPages/main_left_panel.dart';
import 'package:aces/components/text.dart';
import 'package:aces/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key, required this.title});
  final String title;

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  Map<int, bool> expandedStates = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        title: const Row(
          children: [
            CustomText(
              text: 'Leaderboard',
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('leaderboard')
              .orderBy('timestamp', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text(
                  'No relevant data',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              );
            }

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

            final leaderboard = snapshot.data!.docs;

            return ListView.builder(
              itemCount: leaderboard.length,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              itemBuilder: (context, index) {
                final eventboard =
                    leaderboard[index].data() as Map<String, dynamic>;
                final timestamp = eventboard['timestamp'] as Timestamp?;
                final eventDate = timestamp?.toDate();
                final eventName = eventboard['eventname'] ?? 'Event Name';
                final description = eventboard['description'] ?? 'Description';
                final firstPlace = eventboard['first'] ?? 'First Place';
                final fyear = eventboard['fyear'] ?? 'First year';
                final fbranch = eventboard['fbranch'] ?? 'First branch';
                final fRank = eventboard['firstRank'] ?? 'Rank: 1';
                final secondPlace = eventboard['second'] ?? 'Second Place';
                final syear = eventboard['syear'] ?? 'Second year';
                final sbranch = eventboard['sbranch'] ?? 'Second branch';
                final sRank = eventboard['secondRank'] ?? 'Rank: 2';
                final thirdPlace = eventboard['third'] ?? 'Third Place';
                final tyear = eventboard['tyear'] ?? 'Third year';
                final tbranch = eventboard['tbranch'] ?? 'Third branch';
                final tRank = eventboard['thirdRank'] ?? 'Rank: 3';

                eventboard['timestamp'].toDate();

                final isExpanded = expandedStates[index] ?? false;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      expandedStates[index] = !(expandedStates[index] ?? false);
                    });
                  },
                  child: AnimatedSize(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.lightGray2,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 10,
                            offset: const Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                eventName,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),

                          const SizedBox(height: 5),
                          Text(
                            description,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 10),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.calendar_today,
                                size: 14,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 5),
                              eventDate != null
                                  ? Text(
                                      eventDate
                                          .toLocal()
                                          .toString()
                                          .split(' ')[0],
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    )
                                  : const Text(
                                      'N/A',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                              const SizedBox(
                                width: 85,
                              ),
                              Container(
                                height: 30,
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: const LinearGradient(
                                    colors: [Colors.pink, Colors.orange],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.blue.withOpacity(0.5),
                                      blurRadius: 10,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: const Center(
                                  child: Text(
                                    'Show winners!',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),

                          // Expandable Winner Info
                          if (isExpanded)
                            Column(
                              children: [
                                const SizedBox(height: 16),
                                // First Place
                                _buildWinnerCard(
                                  icon: 'assets/firstRank.png',
                                  winnerName: firstPlace,
                                  year: fyear,
                                  branch: fbranch,
                                  rank: fRank,
                                ),
                                const SizedBox(height: 16),
                                // Second Place
                                _buildWinnerCard(
                                  icon: 'assets/secondRank.png',
                                  winnerName: secondPlace,
                                  year: syear,
                                  branch: sbranch,
                                  rank: sRank,
                                ),
                                const SizedBox(height: 16),
                                // Third Place
                                _buildWinnerCard(
                                  icon: 'assets/thirdRank.png',
                                  winnerName: thirdPlace,
                                  year: tyear,
                                  branch: tbranch,
                                  rank: tRank,
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
        ),
      ),
    );
  }

  Widget _buildWinnerCard({
    required String icon,
    required String winnerName,
    required String year,
    required String branch,
    required String rank,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Trophy Icon
        ClipOval(
          child: Image.asset(
            icon,
            height: 70,
            width: 70,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(width: 10),
        // Winner Name and Details
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              winnerName,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            // Rank, Year, and Branch
            Row(
              children: [
                Text(
                  rank,
                  style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 10),
                Text(
                  '$year - $branch',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
