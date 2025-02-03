import 'package:aces/components/text.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../constants/colors.dart';

class upload_leaderboard extends StatefulWidget {
  const upload_leaderboard({super.key, required this.title});
  final String title;

  @override
  State<upload_leaderboard> createState() => _upload_leaderboard();
}

class _upload_leaderboard extends State<upload_leaderboard> {
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
      'eventname': eventnameController.text,
      'first': firstnameController.text,
      'second': secondnameController.text,
      'third': thirdnameController.text,
      'moderatorToken': '0101',
      'timestamp': FieldValue.serverTimestamp(),
      'fyear': fyearController.text,
      'syear': syearController.text,
      'tyear': tyearController.text,
      'description': descriptionController.text,
    });

    // Clearing the textfields after adding the notif:
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
      appBar: AppBar(
        backgroundColor: AppColors.scarletRed,
        iconTheme: const IconThemeData(size: 30),
        title: const Row(
          children: [
            CustomText(
              text: 'Update Leaderboard',
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0), // Reduced padding for better view
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Enter the following details:',
                  style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 15),
                buildTextField("Enter Event Name", eventnameController),
                buildTextField("Enter Event Description", descriptionController),
                buildTextField("Enter First Prize Name", firstnameController),
                buildTextField("Enter Year for First Prize", fyearController),
                buildTextField("Enter Second Prize Name", secondnameController),
                buildTextField("Enter Year for Second Prize", syearController),
                buildTextField("Enter Third Prize Name", thirdnameController),
                buildTextField("Enter Year for Third Prize", tyearController),
                const SizedBox(height: 20),
                // Elevated button with border and padding
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.blueAccent, width: 2),
                  ),
                  child: ElevatedButton(
                    onPressed: addLeaderBoard,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: 5, // Adding elevation for a raised look
                    ),
                    child: const Text(
                      'Send to the LeaderBoard!',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Reusable method to create text fields with consistent styling
  Widget buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),

          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: TextField(
          controller: controller,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(color: Colors.black),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
        ),
      ),
    );
  }
}
