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
  TextEditingController imgurlController = TextEditingController();
  TextEditingController year1Controller = TextEditingController();
  TextEditingController year2Controller = TextEditingController();
  TextEditingController year3Controller = TextEditingController();

  Future<void> addLeaderBoard() async {
    await FirebaseFirestore.instance.collection('leaderboard').add({
      'eventname' : eventnameController.text,
      'first' : firstnameController.text,
      'second' : secondnameController.text,
      'third': thirdnameController.text,
      'moderatorToken' : '0101',
      'timestamp': FieldValue.serverTimestamp(),
      'img_url': imgurlController.text,
      'year1': year1Controller.text,
      'year2': year2Controller.text,
      'year3': year3Controller.text,
    });

    //Clearing the textfields after adding the notif:
    eventnameController.clear();
    firstnameController.clear();
    secondnameController.clear();
    thirdnameController.clear();
    imgurlController.clear();
    year1Controller.clear();
    year2Controller.clear();
    year3Controller.clear();
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
                    controller: year1Controller,
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
                    controller: year2Controller,
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
                    controller: year3Controller,
                    decoration: const InputDecoration(labelText: "Enter Year",
                        labelStyle: TextStyle(color: Colors.white))
                ),
              ),
              const SizedBox(height: 10,),
              SizedBox(
                width: 480,
                child: TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: imgurlController,
                    decoration: const InputDecoration(labelText: "Enter Image URL if any",
                        labelStyle: TextStyle(color: Colors.white))
                ),
              ),
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
              final imgUrl = eventboard['img_url'] ?? '';
              final eventName = eventboard['eventname'] ?? 'Event Name';
              final firstPlace = eventboard['first'] ?? 'First Place';
              final secondPlace = eventboard['second'] ?? 'Second Place';
              final thirdPlace = eventboard['third'] ?? 'Third Place';

              return GestureDetector(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  margin:  const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF003366), Color(0xFF001F54)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 5,
                        offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      if (eventboard['img_url'] != null &&
                          eventboard['img_url'].isNotEmpty)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            eventboard['img_url'],
                            height: 70,
                            width: 90,
                            fit: BoxFit.contain,
                          ),
                        ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              eventboard['eventname'] ?? 'Event Name',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 5),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(
                                      'I. ',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      eventboard['first'] ?? 'First Place',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(
                                      'II. ',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      eventboard['second'] ?? 'Second Place',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(
                                      'III. ',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      eventboard['third'] ?? 'Third Place',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 5),
                                // Text(
                                //   date.toString().split(' ')[0],//formats timestamp to show only the date
                                //   style: const TextStyle(fontSize: 14,
                                //       color: Colors.grey),
                                // ),
                              ],
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
      ),
    );
  }
}
