import 'package:aces/SidebarNavPages/main_left_panel.dart';
import 'package:aces/components/button_multiline.dart';
import 'package:aces/constants/AppImages.dart';
import 'package:aces/userHome/bottomNavBar/user_page1/event_gallery.dart';
import 'package:aces/userHome/bottomNavBar/user_page1/magazine.dart';
import 'package:aces/userHome/bottomNavBar/user_page1/membership_qr.dart';
import 'package:aces/userHome/bottomNavBar/user_page1/news_letter.dart';
import 'package:aces/userHome/bottomNavBar/user_page1/teamAces.dart';
import 'package:aces/userHome/bottomNavBar/user_page1/year_calendar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/text.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key, required this.title});
  final String title;
  @override
  State<Page1> createState() => _Page1();
}

class _Page1 extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(size: 28, color: Colors.white),
        title: const Row(
          children: [
            CustomText(
                text: 'Home', fontSize: 18.0, fontWeight: FontWeight.w500),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                CarouselSlider(
                    items: [
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: const DecorationImage(
                            image: AssetImage(AppImages.homeSlider1),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: const DecorationImage(
                            image: AssetImage(AppImages.homeSlider2),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: const DecorationImage(
                            image: AssetImage(AppImages.homeSlider3),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                      height: 200,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration:
                      const Duration(milliseconds: 600),
                      viewportFraction: 1,
                    )),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomMultilineButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const year_calender(),
                              ),
                            );
                          },
                          text1: "Year",
                          text2: "Calendar",
                          textColor: Colors.black,
                          icon: Image.asset(AppImages.calender, width: 50,),
                        ),
                        CustomMultilineButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const EventGallery(),
                              ),
                            );
                          },
                          text1: "Past Event",
                          text2: "Gallery",
                          textColor: Colors.black,
                          icon: Image.asset(AppImages.gallery, height: 50,)
                        ),
                      ],
                    ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomMultilineButton(
                          onPressed: () {
                            launchURL("https://acespvgcoet.in/");
                          },
                          text1: "Visit our",
                          text2: "website",
                          textColor: Colors.black,
                          icon: Image.asset(AppImages.visitSite, width: 42,),
                        ),
                        CustomMultilineButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                const membership_qr(title: "QR"),
                              ),
                            );
                          },
                          text1: "Your Digital",
                          text2: "Identity",
                          textColor: Colors.black,
                          icon: Image.asset(AppImages.digitalID, height: 42,),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomMultilineButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => NewsletterScreen(),
                              ),
                            );
                          },
                          icon: Image.asset(AppImages.newsletter, height: 50,),
                          text1: "News",
                          text2: "Letter",
                          textColor: Colors.black,
                        ),
                        CustomMultilineButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const magazine(
                                  title: "magazine",
                                ),
                              ),
                            );
                          },
                          text1: "Magazine",
                          text2: "",
                          textColor: Colors.black,
                          icon: Image.asset(AppImages.magazineIcon, height: 50,),
                        )
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomMultilineButton(
                          onPressed: () {
                            launchURL(
                                "https://docs.google.com/forms/d/e/1FAIpQLSddCTSL5zr3NRVN68qxq4sggeEkPj5y6QYINu6iYMWpOnZmfg/viewform?usp=header");
                          },
                          text1: "Be a part of",
                          text2: "ACES family",
                          textColor: Colors.black,
                          icon: Image.asset(AppImages.bePart, height: 40,),
                        ),
                        CustomMultilineButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                  const teamAces(title: "Team Aces")
                              ),
                            );
                          },
                          text1: "Team",
                          text2: "Aces",
                          textColor: Colors.black,
                          icon: Image.asset(AppImages.team, height: 50,),
                        ),

                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 400,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> launchURL(String url) async {
  final Uri uri = Uri.parse(url);

  if (await canLaunchUrl(uri)) {
    await launchUrl(
      uri,
    );
  } else {
    throw 'Could not launch $url';
  }
}