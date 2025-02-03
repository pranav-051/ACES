import 'package:aces/components/custom_button.dart';
import 'package:aces/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../SidebarNavPages/main_left_panel.dart';
import '../../components/StaffProfileCard.dart';
import '../../components/text.dart';

class Page4 extends StatefulWidget {
  const Page4({super.key, required this.title});
  final String title;
  @override
  State<Page4> createState() => _Page4();
}

class _Page4 extends State<Page4> {
  bool vis = false;
  final String videoUrl = 'https://www.youtube.com/watch?v=tbyuHRS17HQ';
  final _controller = YoutubePlayerController(initialVideoId: 'tbyuHRS17HQ');

  @override
  void initState() {
    super.initState();
    _controller.loadVideoById(videoId: "tbyuHRS17HQ");
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        vis = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        title: const Row(
          children: [
            CustomText(
              text: 'About ACES',
              fontSize: 18.0,
              fontWeight: FontWeight.w500
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          CarouselSlider(
              items: [
                Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: const DecorationImage(
                      image: AssetImage("assets/imag1.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: const DecorationImage(
                      image: AssetImage("assets/imag2.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: const DecorationImage(
                      image: AssetImage("assets/imag3.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: const DecorationImage(
                      image: AssetImage("assets/imag2.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
              options: CarouselOptions(
                height: 180,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 600),
                viewportFraction: 1,
              )),
          const Divider(),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              AnimatedOpacity(
                opacity: vis ? 1 : 0,
                duration: const Duration(seconds: 1),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.09,
                  height: MediaQuery.of(context).size.width * 0.09,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const CircleAvatar(
                    radius: 75,
                    backgroundImage: AssetImage(
                      'assets/acesLogo1.png',
                    ),
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              const CustomText(
                text: 'Brief about committee ACES',
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  textAlign: TextAlign.justify,
                  "\u00A0 \u00A0 \u00A0 ACES focuses on leveling up the competency levels for their undergraduates by providing them a platform to recognize their skill set deep insights about computational systems and related disciplines so that they can build their brand in the highly competitive field of Computer Engineering."
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  textAlign: TextAlign.justify,
                  "\u00A0 \u00A0 \u00A0  Our mission is to work with passion towards the intellectual and cognitive growth of students, inculcating an environment of innovation, creativity, instilling the values of sharing, hard work, loyalty and respect towards knowledge and the society and evolve to be engaged community leaders."
                ),
              ],
            ),
          ),
          const Divider(),
          const SizedBox(
            height: 25,
          ),
          const Row(
            children: [
              SizedBox(
                width: 20,
              ),
              CustomText(
                textAlign: TextAlign.center,
                text: "All teams of ACES",
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 15,
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          CustomButton(
            onPressed: () {},
            text: "Technical Team",
            width: 340,
            height: 50,
            backgroundColor: AppColors.lightGray2,
            textColor: AppColors.oxfordBlue,
              borderColor: AppColors.scarletColor,borderWidth: 0.4
          ),
          const SizedBox(
            height: 5,
          ),
          CustomButton(
              onPressed: () {},
              text: "Web Team ",
              width: 340,
              backgroundColor: AppColors.lightGray2,
              textColor: AppColors.oxfordBlue, borderColor: AppColors.scarletColor,borderWidth: 0.4),
          const SizedBox(
            height: 5,
          ),
          CustomButton(
              onPressed: () {},
              text: "Event Team ",
              width: 340,
              backgroundColor: AppColors.lightGray2,
              textColor: AppColors.oxfordBlue, borderColor: AppColors.scarletColor,borderWidth: 0.4),
          const SizedBox(
            height: 5,
          ),
          CustomButton(
              onPressed: () {},
              text: "Editorial team",
              width: 340,
              backgroundColor: AppColors.lightGray2,
              textColor: AppColors.oxfordBlue, borderColor: AppColors.scarletColor,borderWidth: 0.4),
          const SizedBox(
            height: 5,
          ),
          CustomButton(
              onPressed: () {},
              text: "Design and Production team",
              width: 340,
              backgroundColor: AppColors.lightGray2,
              textColor: AppColors.oxfordBlue, borderColor: AppColors.scarletColor,borderWidth: 0.4),
          const SizedBox(
            height: 5,
          ),
          CustomButton(
              onPressed: () {},
              text: "Media team",
              width: 340,
              backgroundColor: AppColors.lightGray2,
              textColor: AppColors.oxfordBlue, borderColor: AppColors.scarletColor,borderWidth: 0.4,),
          const SizedBox(
            height: 5,
          ),
          CustomButton(
              onPressed: () {},
              text: "Treasury team",
              width: 340,
              backgroundColor: AppColors.lightGray2,
              textColor: AppColors.oxfordBlue, borderColor: AppColors.scarletColor,borderWidth: 0.4),
          const SizedBox(
            height: 20,
          ),

          const Row(
            children: [
              SizedBox(
                width: 20,
              ),
              CustomText(
                textAlign: TextAlign.start,
                text: 'Some glimps',
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
          const SizedBox(height: 5,),
          YoutubePlayer(
            controller: _controller, // Controler that we created earlier
            aspectRatio: 16 / 9,     // Aspect ratio you want to take in screen
          ),

          const Divider(),
          const SizedBox(
            height: 20,
          ),

          const Row(
            children: [
              SizedBox(
                width: 20,
              ),
              CustomText(
                textAlign: TextAlign.start,
                text: 'Vision, Mission & Objectives',
                fontWeight: FontWeight.w500
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
          Container(
            height: 400,
            color: Colors.blueGrey[50],
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    const SizedBox(height: 20),
                    Image.asset(
                      'assets/vision.jpg',
                      height: 90,
                      width: 180,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "ACES: Vision",
                      style: TextStyle(
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 250,
                      height: 200,
                      child: Text("• To promote a vibrant culture of social, educational and cultural interaction, continuously building a technical ecosystem in which students enrich their practical knowledge and extol the department throughout the university",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                              color: Colors.blueGrey,), textAlign: TextAlign.justify,),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 22,
                    ),
                    Image.asset(
                      'assets/mission.jpg',
                      height: 100,
                      width: 210,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const Text(
                      "     ACES: Mission",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.blueGrey),
                    ),
                    const SizedBox(
                      width: 250,
                      height: 210,
                      child:  Text("• To work with passion towards the intellectual and cognitive growth of students, inculcating an environment of innovation, creativity, instilling the values of sharing, hard work, loyalty and respect towards knowledge and the society and evolve to be engaged community leaders.",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                              color: Colors.blueGrey,), textAlign: TextAlign.justify,),
                    )
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    const SizedBox(height: 20),
                    Image.asset(
                      'assets/objectives.png',
                      height: 80,
                      width: 180,
                      // fit: BoxFit.fill,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                   const Text(
                      "ACES: Objectives ",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.blueGrey),
                    ),
                    const SizedBox(
                      width: 250,
                      height: 250,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text("""• To provide a platform for students to showcase their talents and skills in various domains and all perceivable fields.""",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14,
                                    color: Colors.blueGrey), textAlign: TextAlign.justify),
                            Text("""• To provide technical as well as non – technical grooming to the students by organizing various workshops and activities, catalyzing growth.""",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14,
                                    color: Colors.blueGrey), textAlign: TextAlign.justify),
                            Text("""• To inculcate the values of team work, leadership, management and soft skills.""",
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                                color: Colors.blueGrey), textAlign: TextAlign.justify,),
                          ],
                        ),
                      )
                    )
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(
            children: [
              SizedBox(
                width: 20,
              ),
              CustomText(
                textAlign: TextAlign.start,
                text: "Staff Coordinators",
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                StaffProfileCard(
                  name: "Prof. U M Kalshetti",
                  position: "Chairman",
                  imageAssetPath: "assets/people/Urmila_Kalshetti.jpg",
                  linkedinUrl: "https://www.linkedin.com/in/johndoe",
                  emailUrl: "mailto:johndoe@example.com",
                ),
                SizedBox(
                  width: 10,
                ),
                StaffProfileCard(
                  name: "Prof. M S Pokale",
                  position: "Staff Coordinator",
                  imageAssetPath: "assets/people/Mamata_Pokale.jpeg",
                  linkedinUrl: "https://www.linkedin.com/in/johndoe",
                  emailUrl: "mailto:johndoe@example.com",
                )
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            width: double.infinity,
            color: const Color(0xFF001F54),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Contact Us-",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Email action
                        launchUrl(Uri.parse('mailto:email@pvgcoet.ac.in'));
                      },
                      child: const Text(
                        "Email: acescomppvg@gmail.com",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Phone: 1234567890",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {
                        // Instagram action
                        launchUrl(
                            Uri.parse('https://www.instagram.com/acespvg/'));
                      },
                      child: const Text(
                        "Instagram: @acespvgcoet",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

extension on YoutubePlayerController {
  void loadVideoById({required String videoId}) {}
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

