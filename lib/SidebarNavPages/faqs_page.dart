import 'package:aces/components/text.dart';
import 'package:flutter/material.dart';

class SideNavPage5 extends StatefulWidget {
  const SideNavPage5({super.key, required this.title});
  final String title;
  @override
  State<SideNavPage5> createState() => _SideNavPage5();
}

class _SideNavPage5 extends State<SideNavPage5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Row(
            children: [
              CustomText(
                text: 'FAQs',
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                ),
            ],
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(40),
          children: <Widget>[
            ExpansionTile(
              title: const Text('What do we do?'),
              children: <Widget>[
                ListTile(
                  title: const Text("ACES looks forward to the welfare of its students by conducting ambitious conferences and workshops. Events are held to broaden the skill set of our students and assist them in their domain. At ACES, we encourage participation in academics as well as extra-curricular activities"
                     " We provide technical as well as non technical support to the students by organizing different workshops, events & Hackathons."
                      "We hone the talents at the right time and help them grow by providing them a platform to showcase their skills in different domains"),
                  onTap: () {
                    // Do something when item 1 is tapped
                  },
                ),
              ],
            ),
            const Divider(height: 1),
            const SizedBox(
              height: 20,
            ),

            ExpansionTile(
              title: const Text('What opportunities ACES provides?'),
              children: <Widget>[
                ListTile(
                  title: const Text("ACES promotes participation and exploration of self-interests. Each event aims at the expansion of the skill sets of the students. We provide them with a platform to showcase their talent. With our faculty and committee, we strive to provide an ocean of opportunities for them to dive in"), onTap: () {
                  },
                ),
              ],
            ),
            const Divider(height: 1),
           ],
        )

    );
  }
}