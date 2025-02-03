import 'package:aces/components/eventHeader.dart';
import 'package:aces/components/text.dart';
import 'package:flutter/material.dart';
import 'image_paths.dart'; // Import the image paths file

class EventGallery extends StatelessWidget {
  const EventGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Gallery'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildCard(context, folder1Images, 'Event 1', '20/20/2020'),
            const SizedBox(height: 16),
            _buildCard(context, folder2Images, 'Event 2', '10/10/2021'),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, List<String> imagePaths, String folderName, String eventDate) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImageGridScreen(
              imagePaths: imagePaths,
              folderName: folderName,
              eventDate: eventDate,
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EventHeader(eventName: folderName, eventDate: eventDate),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: imagePaths.take(4).map((path) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      path,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageGridScreen extends StatelessWidget {
  final List<String> imagePaths;
  final String folderName;

  const ImageGridScreen({
    super.key,
    required this.imagePaths,
    required this.folderName, required String eventDate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:         CustomText(
          text: (folderName),
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePaths[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
