import 'dart:math';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:aces/firebase_options.dart';
import 'package:url_launcher/url_launcher.dart';


class changeleaderboard extends StatefulWidget {
  const changeleaderboard({super.key, required this.title});
  final String title;
  @override
  State<changeleaderboard> createState() => _changeleaderboardState();
}

class _changeleaderboardState extends State<changeleaderboard> {
  //event name, top 3 names and class/year, images
  TextEditingController eventnameController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController secondnameController = TextEditingController();
  TextEditingController thirdnameController = TextEditingController();
  TextEditingController fyearController = TextEditingController();
  TextEditingController syearController = TextEditingController();
  TextEditingController tyearController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Future<void> addLeaderBoard() async {
    await FirebaseFirestore.instance.collection('leaderboard').add({
      'eventname' : eventnameController.text,
      'first' : firstnameController.text,
      'second' : secondnameController.text,
      'third': thirdnameController.text,
      'moderatorToken' : '0101',
      'timestamp': FieldValue.serverTimestamp(),
      'fyear': fyearController.text,
      'syear': syearController.text,
      'tyear': tyearController.text,
      'description': descriptionController.text,
    });

    //Clearing the textfields after adding the notif:
    eventnameController.clear();
    firstnameController.clear();
    secondnameController.clear();
    thirdnameController.clear();
    fyearController.clear();
    syearController.clear();
    tyearController.clear();
    descriptionController.clear();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Update Leaderboard', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Text('Enter the following details: ', style: TextStyle(color: Colors.white),),
              const SizedBox(height: 10,),
              SizedBox(
                width: 480,
                child: TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: eventnameController,
                    decoration: const InputDecoration(labelText: "Enter Event Name",
                        labelStyle: TextStyle(color: Colors.white))
                ),
              ),
              const SizedBox(height: 10,),
              SizedBox(
                width: 480,
                child: TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: descriptionController,
                    decoration: const InputDecoration(labelText: "Enter Event Description",
                        labelStyle: TextStyle(color: Colors.white))
                ),
              ),
              const SizedBox(height: 10,),
              SizedBox(
                width: 480,
                child: TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: firstnameController,
                    decoration: const InputDecoration(labelText: "Enter First Prize name",
                        labelStyle: TextStyle(color: Colors.white))
                ),
              ),
              const SizedBox(height: 10,),
              SizedBox(
                width: 480,
                child: TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: fyearController,
                    decoration: const InputDecoration(labelText: "Enter Year",
                        labelStyle: TextStyle(color: Colors.white))
                ),
              ),
              const SizedBox(height: 10,),
              SizedBox(
                width: 480,
                child: TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: secondnameController,
                    decoration: const InputDecoration(labelText: "Enter Second Prize name",
                        labelStyle: TextStyle(color: Colors.white))
                ),
              ),

              const SizedBox(height: 10,),
              SizedBox(
                width: 480,
                child: TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: syearController,
                    decoration: const InputDecoration(labelText: "Enter Year",
                        labelStyle: TextStyle(color: Colors.white))
                ),
              ),
              const SizedBox(height: 10,),
              SizedBox(
                width: 480,
                child: TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: thirdnameController,
                    decoration: const InputDecoration(labelText: "Enter Third Prize name",
                        labelStyle: TextStyle(color: Colors.white))
                ),
              ),
              const SizedBox(height: 10,),
              SizedBox(
                width: 480,
                child: TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: tyearController,
                    decoration: const InputDecoration(labelText: "Enter Year",
                        labelStyle: TextStyle(color: Colors.white))
                ),
              ),
              const SizedBox(height: 10,),
              ElevatedButton(onPressed: addLeaderBoard, child: const Text('Send to the LeaderBoard!'))
            ],
          ),
        ),
      ),
    );
  }
}

class leaderboard extends StatefulWidget {
  const leaderboard({super.key, required this.title});
  final String title;
  @override
  State<leaderboard> createState() => _leaderboardState();
}
class _leaderboardState extends State<leaderboard> {
  // Keep track of which container is expanded
  Map<int, bool> expandedStates = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Leaderboard',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 2.0,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('leaderboard')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text(
                'No relevant data',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(color: Colors.white),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white,),
            );
          }

          final leaderboard = snapshot.data!.docs;

          return ListView.builder(
            itemCount: leaderboard.length,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            itemBuilder: (context, index) {
              final eventboard = leaderboard[index].data() as Map<String, dynamic>;
              final timestamp = eventboard['timestamp'] as Timestamp?;
              final eventDate = timestamp?.toDate();
              final eventName = eventboard['eventname'] ?? 'Event Name';
              final description = eventboard['description'] ?? 'Description';
              final firstPlace = eventboard['first'] ?? 'First Place';
              final fyear = eventboard['fyear'] ?? 'First cha year';
              final fbranch = eventboard['fbranch'] ?? 'First chi branch';
              final secondPlace = eventboard['second'] ?? 'Second Place';
              final syear = eventboard['syear'] ?? 'Second cha year';
              final sbranch = eventboard['sbranch'] ?? 'Second chi branch';
              final thirdPlace = eventboard['third'] ?? 'Third Place';
              final tyear = eventboard['tyear'] ?? 'Third cha year';
              final tbranch = eventboard['tbranch'] ?? 'Third chi branch';
              DateTime date = eventboard['timestamp'].toDate();

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
                  child: AnimatedContainer(
                  duration: Duration(milliseconds: 500,),
                  curve: Curves.fastLinearToSlowEaseIn,
                  child: Container(
                  padding: const EdgeInsets.all(10),
                  margin:  const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 20,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              eventboard['eventname'] ?? 'Event Name',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              eventboard['description'] ?? 'Description',
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.grey, fontSize: 13),),
                            const SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Icon(Icons.calendar_today, size: 14, color: Colors.grey,),
                                const SizedBox(width: 5,),
                                Text(
                                  textAlign: TextAlign.center,
                                  date.toLocal().toString().split(' ')[0],
                                  style: TextStyle(color: Colors.grey, fontSize: 12),
                                ),],),
                            const SizedBox(height: 5),
                            Text(
                              'Tap to show winners!',
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.grey, fontSize: 13),),
                          ],
                        ),
                      ),
                      if (isExpanded)
                        AnimatedCrossFade(firstChild: const SizedBox.shrink(),
                            crossFadeState: isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst, duration: Duration(milliseconds: 3000),
                          secondChild: Column(
                        children: [
                          const SizedBox(height: 16,),
                          const SizedBox(width: 100,),
                          ClipOval(
                            child: Image.network(
                              'https://cdn-icons-png.flaticon.com/512/6394/6394616.png',
                              height: 60,
                              width: 60,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(width: 100,),
                          const SizedBox(width: 10, height: 20,),
                          ClipOval(
                            child: Image.network(
                              'https://cdn-icons-png.flaticon.com/512/5406/5406611.png',
                              height: 60,
                              width: 60,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(width: 100,),
                          const SizedBox(width: 10, height: 16,),
                          ClipOval(
                            child: Image.network(
                              'https://cdn.iconscout.com/icon/premium/png-512-thumb/third-prize-520169.png',
                              height: 60,
                              width: 60,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(width: 10, height: 16,),

                        ],
                      ),
                  ),
                      const SizedBox(width: 20,),
                      if (isExpanded)
                      Expanded(
                        child: Column(
                          children: [
                            const SizedBox(height: 16,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  eventboard['first'] ?? 'First Place',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                            const SizedBox(height: 8,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(child: Text(
                                  eventboard['fyear'] ?? 'First cha year',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  eventboard['fbranch'] ?? 'First chi branch',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 16,),
                            // Expanded(child: Container(
                            //   color: Colors.black,
                            // ),
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(child: Text(
                                  eventboard['second'] ?? 'Second Place',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  eventboard['syear'] ?? 'Second cha year',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 8,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  eventboard['sbranch'] ?? 'Second chi branch',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 16,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  eventboard['third'] ?? 'Third Place',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                            const SizedBox(height: 8,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  eventboard['tyear'] ?? 'Third cha year',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 8,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  eventboard['tbranch'] ?? 'Third chi branch',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 16,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                  ),
                 ),
              );

            },
          );
        },
      ),
    );
  }
}
