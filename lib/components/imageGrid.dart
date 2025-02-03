import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart'; // Ensure you have this dependency

class ImageGrid extends StatelessWidget {
  final int crossAxisCount; // Number of columns
  final double mainAxisSpacing; // Vertical spacing between images
  final double crossAxisSpacing; // Horizontal spacing between images
  final List<String> imageList; // List of image URLs or asset paths

  // Constructor to initialize values
  const ImageGrid({
    Key? key,
    required this.crossAxisCount,
    required this.mainAxisSpacing,
    required this.crossAxisSpacing,
    required this.imageList,
  }) : super(key: key);

  // Function to build each grid item (image)
  Widget _buildGridItem(String imagePath) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          imagePath, // Load images from assets or use Image.network for URLs
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: mainAxisSpacing,
      crossAxisSpacing: crossAxisSpacing,
      itemCount: imageList.length,
      itemBuilder: (context, index) {
        return _buildGridItem(imageList[index]);
      },
    );
  }
}
