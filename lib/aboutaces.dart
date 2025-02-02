import 'package:flutter/material.dart';

class aboutaces extends StatefulWidget {
  const aboutaces({super.key, required this.title});
  final String title;
  @override
  State<aboutaces> createState() => _aboutacesState();
}

class _aboutacesState extends State<aboutaces> {
  bool vis=false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        vis = true;
      });
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'About ACES',
          style: TextStyle(color: Colors.white,),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //photo carousel
              //    slider.CarouselSlider(items:
              //    ['photos'].map((i) {
              //    return Builder(builder: (BuildContext context) {
              //    return Container(
              //     width: MediaQuery.of(context).size.width,
              //     margin: const EdgeInsets.symmetric(horizontal: 5.0),
              //      decoration: const BoxDecoration(color: Colors.grey),
              //      child: Image.asset(i, fit: BoxFit.cover,),
              //     );
              //     });
              //     }).toList(),
              // options: slider.CarouselOptions(height: 200, autoPlay: true)),

              //ACES Brief
              //aceslogo
              const SizedBox(height: 40,),
              AnimatedOpacity(opacity: vis ? 1 : 0, duration: Duration(seconds: 1),
                child: Container(
                  width: MediaQuery.of(context).size.width*0.5,
                  height: MediaQuery.of(context).size.width*0.5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: const CircleAvatar(
                    radius: 75,
                    backgroundImage: AssetImage('assets/acesLogo1.png'),
                    backgroundColor: Colors.white,
                    foregroundImage: AssetImage('assets/acesLogo1.png'),
                  ),
                ),
              ),

              //basic description
              const SizedBox(height: 20,),
              Padding(
                padding:const EdgeInsets.all(16),
                child: Container(
                  alignment:Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF003366), Color(0xFF001F54)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: const Text(
                    "ABOUT ACES", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold,),
                  ),),),
              const Padding(padding: EdgeInsets.all(16),
                child: Text(
                  "The description", style: TextStyle(color: Colors.black, fontSize: 16),
                ),),

              //Hierarchy/Tree Diagram

              // Vision and Mission
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  alignment:Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF003366), Color(0xFF001F54)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: const Text(
                    "VISION AND MISSION",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Vision: something something.\n"
                      "Mission: lmao no mission.\n",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),


              //staff coord 1
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  alignment:Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF003366), Color(0xFF001F54)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: const Text(
                    "STAFF COORDINATORS",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              //tyancha photu
              AnimatedOpacity(opacity: vis ? 1 : 0, duration: Duration(seconds: 1),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.25,
                      height: MediaQuery.of(context).size.width*0.25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: const CircleAvatar(
                        radius: 75,
                        backgroundImage: AssetImage('assets/acesLogo1.png'),
                        backgroundColor: Colors.white,
                        foregroundImage: AssetImage('assets/acesLogo1.png'),
                      ),

                    ),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(width: 20,),
                        Text('HOD mam',
                          textAlign: TextAlign.end,
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "Description",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20,),
              //staff coord 2
              //tyancha photu
              AnimatedOpacity(opacity: vis ? 1 : 0, duration: Duration(seconds: 1),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.25,
                      height: MediaQuery.of(context).size.width*0.25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: const CircleAvatar(
                        radius: 75,
                        backgroundImage: AssetImage('assets/acesLogo1.png'),
                        backgroundColor: Colors.white,
                        foregroundImage: AssetImage('assets/acesLogo1.png'),
                      ),

                    ),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(width: 20,),
                        Text('Pokale mam',
                          textAlign: TextAlign.end,
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "Description",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20,),

              //Contact Details
              Padding(

                padding: const EdgeInsets.all(16),
                child: Container(
                  alignment:Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF003366), Color(0xFF001F54)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: const Text(
                    "CONTACT US",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Email: email@pvgcoet.ac.in\n\n"
                      "Phone: 1234567890\n\n"
                      "Instagram: @acespvgcoet",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              //PREVIOUS WORKS
              //staff section

            ]
        ),
      ),
    );
  }
}

