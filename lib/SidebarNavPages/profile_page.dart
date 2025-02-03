import 'dart:io';
import 'package:aces/components/text.dart';
import 'package:aces/constants/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final ImagePicker _picker = ImagePicker();

  User? currentUser;
  late Future<Map<String, dynamic>> userDataFuture;
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    currentUser = _auth.currentUser;
    userDataFuture = _loadUserData();
  }

  Future<Map<String, dynamic>> _loadUserData() async {
    if (currentUser != null) {
      try {
        DocumentSnapshot userDoc =
        await _firestore.collection('users').doc(currentUser!.uid).get();
        if (userDoc.exists) {
          return userDoc.data() as Map<String, dynamic>;
        }
      } catch (e) {
        if (kDebugMode) {
          print("Error loading user data: $e");
        }
      }
    }
    return {
      'name': 'Unknown',
      'email': currentUser?.email ?? 'No Email',
      'role': 'User',
      'profileImageUrl': ''
    };
  }

  Future<void> _editName() async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Full Name"),
          content: TextField(
            controller: _nameController,
            decoration: const InputDecoration(hintText: "Enter full name"),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  await _firestore.collection('users').doc(currentUser!.uid).update({
                    'name': _nameController.text,
                  });
                  setState(() {
                    userDataFuture = _loadUserData();
                  });
                  Navigator.pop(context);
                } catch (e) {
                }
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  Future<void> _changeProfilePicture() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      File imageFile = File(image.path);
      try {
        // Upload to Firebase Storage
        String filePath = 'profilePictures/${currentUser!.uid}.jpg';
        UploadTask uploadTask = _storage.ref(filePath).putFile(imageFile);
        TaskSnapshot snapshot = await uploadTask;

        // Get download URL
        String downloadUrl = await snapshot.ref.getDownloadURL();

        // Update Firestore
        await _firestore.collection('users').doc(currentUser!.uid).update({
          'profileImageUrl': downloadUrl,
        });

        setState(() {
          userDataFuture = _loadUserData();
        });
      } catch (e) {
        if (kDebugMode) {
          print("Error uploading profile picture: $e");
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const CustomText(
          text: 'Profile Page',
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: userDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No user data available"));
          }

          // Extract user data
          final userData = snapshot.data!;
          final name = userData['name'] ?? "Unknown";
          final email = userData['email'] ?? "No Email";
          final role = userData['role'] ?? "User";
          final profileImageUrl = userData['profileImageUrl'] ?? "";

          return RefreshIndicator(
            onRefresh: () async {
              setState(() {
                userDataFuture = _loadUserData();
              });
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundImage: profileImageUrl.isNotEmpty
                              ? NetworkImage(profileImageUrl)
                              : const AssetImage('assets/profile_placeholder.png')
                          as ImageProvider,
                          child: GestureDetector(
                            onTap: _changeProfilePicture,
                            child: const Align(
                              alignment: Alignment.bottomRight,
                              child: CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.blue,
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ListTile(
                    title: const Text("Full Name"),
                    subtitle: Text(name),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: _editName,
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text("Email ID"),
                    subtitle: Text(email),
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text("Role"),
                    subtitle: Text(role),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}