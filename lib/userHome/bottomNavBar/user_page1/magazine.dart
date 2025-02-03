import 'package:aces/userHome/bottomNavBar/main_bottom_navigation.dart';
import 'package:aces/components/text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class magazine extends StatelessWidget {
  const magazine({super.key, required String title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

            leading: IconButton(
              icon: const Icon(Icons.arrow_back, size: 30,),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const mainBottomNav(title: "MAIN BOTTOM NAV")),
                );
              },
            ),
            title: const CustomText(
              text: "Magazine",
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const CustomText(
                  textAlign: TextAlign.center,
                  text: "ACE THE TECH",
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),

                const SizedBox(height: 20,),

                TweenAnimationBuilder<double>(
                  tween:
                      Tween<double>(begin: 0.8, end: 1.1), // Scale animation
                  duration: const Duration(seconds: 2), // Animation duration
                  curve: Curves.easeInOut, // Smooth animation curve
                  builder: (context, scale, child) {
                    return Transform.scale(
                      scale: scale, // Apply the scaling
                      child: Container(
                        height: 250,
                        width: 170,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              offset: const Offset(0, 6),
                              blurRadius: 10,
                            ),
                          ],
                          borderRadius:
                              BorderRadius.circular(20), // Rounded corners
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/magazine.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  },
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(width: 270,),
                    FloatingActionButton(
                      onPressed: () {
                        launchURL(
                            "https://drive.google.com/file/d/1y_KbhsvMy9c4Rvw43eCIfN-_4bJRIJe7/view?usp=sharing");
                      }, // Example icon, you can change it
                      backgroundColor: Colors.blue, // Customize button color
                      elevation: 6.0, // Optional: Add elevation for shadow
                      tooltip: 'Add Item',
                      child: const Icon(Icons. bookmarks_sharp), // Optional: Tooltip text
                    ),
                  ],
                ),

                const Text(
                  textAlign: TextAlign.justify,
                  """
                
            \u00A0 \u00A0From designing, writing an article, collecting insightful thoughts and organizing events...Aces is Proud to Publish their First magazine Ace the Tech. Let's Experience the First Ever Virtual Connect.
            
            \u00A0\u00A0 Ace the Tech is a collection of Amazing Contributions depicting the Creative & Innovative minds of PVGians. It truly displays the real insight by reflecting our dreams, Thoughts, Achievements, Creativity & Imagination.
            
            \u00A0\u00A0 It mainly focuses on Industrial & Nonindustrial Trends. The main objective of this quarterly magazine is to bring out collective efforts from all the teams and showcase their Extraordinary efforts to create unique themes quarterly.""",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

Future<void> launchURL(String url) async {
  final Uri uri = Uri.parse(url);

  if (await canLaunchUrl(uri)) {
    await launchUrl(
      uri,
      // mode: LaunchMode.inAppWebView, // Opens the URL in an in-app browser
    );
  } else {
    throw 'Could not launch $url';
  }
}
