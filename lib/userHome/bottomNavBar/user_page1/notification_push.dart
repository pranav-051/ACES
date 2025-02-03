import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class notifpushpage extends StatefulWidget {
  const notifpushpage({super.key});
  @override
  State<notifpushpage> createState() => _notifpushpageState();
}

class _notifpushpageState extends State<notifpushpage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController name_of_modController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController linkController = TextEditingController();
  TextEditingController imgurlController = TextEditingController();

  Future<void> addNotification() async {
    await FirebaseFirestore.instance.collection('notifications').add({
      'title': titleController.text,
      'description': descriptionController.text,
      'link': linkController.text,
      'name_of_mod': name_of_modController.text,
      'moderatorToken': '0101',
      'timestamp': FieldValue.serverTimestamp(),
      'img_url': imgurlController.text,
    }).then((value) => print('Notification added'));

    titleController.clear();
    name_of_modController.clear();
    descriptionController.clear();
    linkController.clear();
    imgurlController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notification Push Page',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Enter the following details:',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                buildTextField(
                  controller: name_of_modController,
                  label: "Enter Moderator Name",
                ),
                const SizedBox(height: 15),
                buildTextField(
                  controller: titleController,
                  label: "Title of the Notification",
                ),
                const SizedBox(height: 15),
                buildTextField(
                  controller: descriptionController,
                  label: "Description",
                  maxLines: null,
                  textInputAction: TextInputAction.newline,
                ),
                const SizedBox(height: 15),
                buildTextField(
                  controller: linkController,
                  label: "Enter Link (if any)",
                ),
                const SizedBox(height: 15),
                buildTextField(
                  controller: imgurlController,
                  label: "Enter Image URL",
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: addNotification,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Send Notification!',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    int? maxLines,
    TextInputAction? textInputAction,
  })
  {
    return TextField(
      controller: controller,
      maxLines: maxLines ?? 1,
      textInputAction: textInputAction ?? TextInputAction.done,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black54),
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),
      ),
    );
  }
}
