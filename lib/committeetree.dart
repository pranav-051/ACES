import 'package:flutter/material.dart';

class acesmember {
  String name;
  String position;
  List<acesmember> subordinates;

  acesmember({required this.name, required this.position, this.subordinates = const []});
}

final committeetree =[
  acesmember(
      name: 'Vaishnavi Choudhari',
      position: "General Secretary"
  ),
  acesmember(name: 'Atharva Chaudhari', position: 'Joint General Secretary'),
];

final teamHeads = [
  acesmember(name: 'Atharv Amble', position: 'Editorial Team Joint Head'),
  acesmember(name: 'Parag Jadhav', position: 'Editorial Team Head'),
  acesmember(name: 'Atharva Kale', position: 'Technical Team Head'),
  acesmember(name: 'Kavishwar Khankari', position: 'Technical Team Joint Head'),
  acesmember(name: 'Aakash Joshi', position: 'Web Team Head'),
  acesmember(name: 'Shravan Chandrachud', position: 'Web Team Joint Head'),
  acesmember(name: 'Sanika Shinde', position: 'Event Team Head'),
  acesmember(name: 'Pranav Pisal', position: 'Event Team Joint Head'),
  acesmember(name: 'Rohan Sonawane', position: 'Treasury Team Head'),
  acesmember(name: 'Ishita Deshpande', position: 'Treasury Team Joint Head'),
  acesmember(name: 'Aryan Desai', position: 'DnP Team Head'),
  acesmember(name: 'Shruti Natekar', position: 'DnP Team Joint Head'),
  acesmember(name: 'Prathamesh Gaikwad', position: 'Media Team Head'),
  acesmember(name: 'Samruddhi Dhon', position: 'Media Team Joint Head'),
];

class CommitteeTree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Committee Tree',
          style: TextStyle(color: Colors.white,fontSize: 24),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[100],
      body: //SingleChildScrollView(
      // child:
      Stack(
        children: [
          CustomPaint(
            painter: LinePainter(),
            child: ListView(
              children: [
                // GS and JGS Section
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      // Text(
                      //   "Committee Tree",
                      //   style: TextStyle(
                      //     fontSize: 24,
                      //     fontWeight: FontWeight.bold,
                      //     letterSpacing: 1.2,
                      //     color: Colors.blueGrey[900],
                      //   ),
                      // ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: committeetree.map(
                              (member) => Column(
                            children: [
                              CircleAvatar(
                                radius: 35,
                                backgroundColor: Colors.blueAccent,
                                child: Icon(
                                  Icons.account_circle,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                member.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.blueGrey[800],
                                  overflow: TextOverflow.ellipsis,
                                ),
                                maxLines: 2,
                              ),
                              Text(
                                member.position,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.blueGrey[600],
                                  overflow: TextOverflow.ellipsis,
                                ),
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ).toList(),
                      ),
                    ],
                  ),
                ),
                // Team Heads Section
                Column(
                  children: teamHeads.asMap().entries.map((entry) {
                    int index = entry.key;
                    acesmember member = entry.value;

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Row(
                        children: [
                          if (index % 2 == 1) Spacer(),
                          Flexible(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 6,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.green,
                                    child: Icon(
                                      Icons.account_circle,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        member.name,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.blueGrey[800],
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        maxLines: 2,
                                      ),
                                      Text(
                                        member.position,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.blueGrey[600],
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        maxLines: 2,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (index % 2 == 0) Spacer(),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
        //),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black!
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // Draw vertical dashed line
    const dashWidth = 4;
    const dashSpace = 6;
    double startY = 0;
    while (startY < size.height) {
      canvas.drawLine(
        Offset(size.width / 2, startY),
        Offset(size.width / 2, startY + dashWidth),
        paint,
      );
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
