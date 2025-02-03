import 'package:aces/components/text.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class ChangeEvent extends StatefulWidget {
  const ChangeEvent({super.key, required this.title});
  final String title;

  @override
  State<ChangeEvent> createState() => _ChangeEventState();
}

class _ChangeEventState extends State<ChangeEvent> {
  TextEditingController eventnameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController registrationLinkController = TextEditingController();

  String mode = 'Online';
  String type = 'Tech';

  Future<void> addEvent() async {
    try {
      // Adding event to Firestore
      await FirebaseFirestore.instance.collection('events').add({
        'eventname': eventnameController.text,
        'description': descriptionController.text,
        'timestamp': FieldValue.serverTimestamp(),
        'time': timeController.text,
        'date': dateController.text,
        'registrationLink': registrationLinkController.text,
        'mode': mode,
        'type': type,
      });

      // Clear the text fields after successful addition
      eventnameController.clear();
      descriptionController.clear();
      timeController.clear();
      dateController.clear();
      registrationLinkController.clear();

      // Reset the values for mode and type
      setState(() {
        mode = 'Online';
        type = 'Tech';
      });

      // Show success feedback (optional)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Event added successfully!')),
      );
    } catch (e) {
      // Show error message if any issue occurs
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

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
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        title: const Row(
          children: [
            CustomText(
                text: 'Update Events',
                fontSize: 18.0,
                fontWeight: FontWeight.w500),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 330,
            child: Column(
              children: [
                const Text('Enter following details: ',
                    style: TextStyle(color: Colors.black)),
                const SizedBox(height: 10),
                SizedBox(
                  width: 480,
                  child: TextField(
                    style: const TextStyle(color: Colors.black),
                    controller: eventnameController,
                    decoration: const InputDecoration(
                        labelText: "Enter Event Name",
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 480,
                  child: TextField(
                    style: const TextStyle(color: Colors.black),
                    controller: descriptionController,
                    maxLines: null,
                    decoration: const InputDecoration(
                      labelText: "Description",
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.newline,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 480,
                  child: TextField(
                    style: const TextStyle(color: Colors.black),
                    controller: timeController,
                    decoration: const InputDecoration(
                        labelText:
                        "Enter Event Time (in Hours:Minutes AM/PM format)",
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 480,
                  child: TextField(
                    style: const TextStyle(color: Colors.black),
                    controller: dateController,
                    decoration: const InputDecoration(
                        labelText: "Enter Event Date (DD/MM/YYYY)",
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 480,
                  child: TextField(
                    style: const TextStyle(color: Colors.black),
                    controller: registrationLinkController,
                    decoration: const InputDecoration(
                        labelText: "Enter Registration Link",
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                ),
                const SizedBox(height: 10),
                const Text('Event Mode:',
                    style: TextStyle(color: Colors.black, fontSize: 16)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio<String>(
                      value: 'Online',
                      groupValue: mode,
                      onChanged: (value) {
                        setState(() {
                          mode = value!;
                        });
                      },
                    ),
                    const Text('Online', style: TextStyle(color: Colors.black)),
                    Radio<String>(
                      value: 'Offline',
                      groupValue: mode,
                      onChanged: (value) {
                        setState(() {
                          mode = value!;
                        });
                      },
                    ),
                    const Text('Offline', style: TextStyle(color: Colors.black)),
                  ],
                ),
                const SizedBox(height: 10),
                const Text('Event Type:',
                    style: TextStyle(color: Colors.black, fontSize: 16)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio<String>(
                      value: 'Tech',
                      groupValue: type,
                      onChanged: (value) {
                        setState(() {
                          type = value!;
                        });
                      },
                    ),
                    const Text('Tech', style: TextStyle(color: Colors.black)),
                    Radio<String>(
                      value: 'Non-Tech',
                      groupValue: type,
                      onChanged: (value) {
                        setState(() {
                          type = value!;
                        });
                      },
                    ),
                    const Text('Non-Tech',
                        style: TextStyle(color: Colors.black)),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: addEvent,
                  child: const Text('Add Event!'),
                ),
                const SizedBox(height: 20),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('events')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const CircularProgressIndicator();
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot event = snapshot.data!.docs[index];
                        return Card(
                          elevation: 5,
                          margin: const EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  event['eventname'],
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  event['description'],
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Date: ${event['date']}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Time: ${event['time']}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Mode: ${event['mode']}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Type: ${event['type']}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(height: 10),
                                InkWell(
                                  onTap: () {
                                    _launchURL(event['registrationLink']);
                                  },
                                  child: Text(
                                    'Registration Link',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blue[800],
                                      decoration: TextDecoration.underline,
                                    ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}