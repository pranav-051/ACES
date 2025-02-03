import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../userHome/bottomNavBar/main_bottom_navigation.dart';
import '../../../components/text.dart';

class year_calender extends StatefulWidget {
  const year_calender({super.key});

  @override
  _year_calender createState() => _year_calender();
}

class _year_calender extends State<year_calender> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // Static events (cannot be modified by the user)
  final Map<DateTime, List<Map<String, String>>> _staticEvents = {
    DateTime(2024, 9, 10): [
      {
        'title': 'Picture Perfect',
        'description': 'Monthly sync-up with the team',
        'time': '10:00 AM',
        'mode': 'Offline'
      },
    ],
    DateTime(2024, 9, 16): [
      {
        'title': 'Tech Trivia',
        'description': 'Monthly sync-up with the team',
        'time': '10:00 AM',
        'mode': 'Offline'
      },
    ],
    DateTime(2024, 9, 18): [
      {
        'title': 'Inauguration',
        'description': 'Monthly sync-up with the team',
        'time': '10:00 AM',
        'mode': 'Offline'
      },
    ],
    DateTime(2024, 9, 13): [
      {
        'title': 'Git / GitHub',
        'description': 'Monthly sync-up with the team',
        'time': '10:00 AM',
        'mode': 'Offline'
      },
    ],
    DateTime(2024, 10, 06): [
      {
        'title': 'Server Workshop',
        'description': 'Monthly sync-up with the team',
        'time': '10:00 AM',
        'mode': 'Offline'
      },
    ],
    DateTime(2024, 10, 10): [
      {
        'title': 'Pythonista',
        'description': 'Monthly sync-up with the team',
        'time': '10:00 AM',
        'mode': 'Offline'
      },
    ],
    DateTime(2024, 10, 18): [
      {
        'title': 'Genesis',
        'description': 'Monthly sync-up with the team',
        'time': '10:00 AM',
        'mode': 'Offline'
      },
    ],
    DateTime(2024, 10, 26): [
      {
        'title': 'Mega code mode',
        'description': 'Monthly sync-up with the team',
        'time': '10:00 AM',
        'mode': 'Offline'
      },
    ],
    DateTime(2024, 10, 31): [
      {
        'title': 'Social Event',
        'description': 'Monthly sync-up with the team',
        'time': '10:00 AM',
        'mode': 'Offline'
      },
    ],
    DateTime(2024, 11, 16): [
      {
        'title': 'Diwali Fiesta',
        'description': 'Monthly sync-up with the team',
        'time': '10:00 AM',
        'mode': 'Offline'
      },
    ],
    DateTime(2024, 11, 25): [
      {
        'title': 'CodeMode',
        'description': 'Monthly sync-up with the team',
        'time': '10:00 AM',
        'mode': 'Offline'
      },
    ],
    DateTime(2024, 12, 08): [
      {
        'title': 'Web Development',
        'description': 'Monthly sync-up with the team',
        'time': '10:00 AM',
        'mode': 'Offline'
      },
    ],
    DateTime(2024, 12, 25): [
      {
        'title': 'Committee Get-Together',
        'description': 'Monthly sync-up with the team',
        'time': '10:00 AM',
        'mode': 'Offline'
      },
    ],
    DateTime(2025, 01, 16): [
      {
        'title': 'Department Decoration',
        'description': 'Monthly sync-up with the team',
        'time': '10:00 AM',
        'mode': 'Offline'
      },
    ],
    DateTime(2025, 01, 14): [
      {
        'title': 'Java Workshop',
        'description': 'Monthly sync-up with the team',
        'time': '10:00 AM',
        'mode': 'Offline'
      },
    ],
    DateTime(2025, 01, 21): [
      {
        'title': 'Non-Tech Event',
        'description': 'Monthly sync-up with the team',
        'time': '10:00 AM',
        'mode': 'Offline'
      },
    ],
    DateTime(2025, 02, 02): [
      {
        'title': 'Hackathon',
        'description': 'Monthly sync-up with the team',
        'time': '10:00 AM',
        'mode': 'Offline'
      },
    ],
    DateTime(2025, 02, 14): [
      {
        'title': 'Social Event',
        'description': 'Monthly sync-up with the team',
        'time': '10:00 AM',
        'mode': 'Offline'
      },
    ],
    DateTime(2025, 12, 21): [
      {
        'title': 'Cyber Security',
        'description': 'Monthly sync-up with the team',
        'time': '10:00 AM',
        'mode': 'Offline'
      },
      {
        'title': 'Game Development',
        'description': 'Monthly sync-up with the team',
        'time': '10:00 AM',
        'mode': 'Offline'
      }
    ],
    DateTime(2025, 02, 29): [
      {
        'title': 'CodeMode',
        'description': 'Monthly sync-up with the team',
        'time': '10:00 AM',
        'mode': 'Offline'
      },
    ],
    DateTime(2025, 03, 04): [
      {
        'title': 'ML Workshop',
        'description': 'Monthly sync-up with the team',
        'time': '10:00 AM',
        'mode': 'Offline'
      },
    ],
    DateTime(2025, 03, 17): [
      {
        'title': 'Algorythm',
        'description': 'Monthly sync-up with the team',
        'time': '10:00 AM',
        'mode': 'Offline'
      },
    ],
    DateTime(2025, 03, 28): [
      {
        'title': 'Mega CodeMode',
        'description': 'Monthly sync-up with the team',
        'time': '10:00 AM',
        'mode': 'Offline'
      },
    ],
    DateTime(2025, 04, 16): [
      {
        'title': 'Grand ACES Year-End Function',
        'description': 'Monthly sync-up with the team',
        'time': '10:00 AM',
        'mode': 'Offline'
      },
    ],
  };

  /// Get events for a specific day
  List<Map<String, String>> _getEventsForDay(DateTime day) {
    return _staticEvents[DateTime(day.year, day.month, day.day)] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
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
            text: "Upcoming events calender",
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          )),
      body: Center(
          child: SizedBox(
            width: 340,
            height: 700,
            child: Column(
              children: [
                TableCalendar(
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  eventLoader: _getEventsForDay,
                  calendarStyle: CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      shape: BoxShape
                          .rectangle, // Ensure shape is rectangle if using borderRadius
                      borderRadius:
                          BorderRadius.circular(8), // Only use with rectangle
                      border: Border.all(color: Colors.blue.shade700, width: 1),
                    ),
                    selectedDecoration: BoxDecoration(
                      color: const Color(0xFF002147), // Oxford Blue
                      shape: BoxShape
                          .rectangle, // Ensure shape is rectangle if using borderRadius
                      borderRadius:
                          BorderRadius.circular(8), // Only use with rectangle
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    markerDecoration: const BoxDecoration(
                      color: Colors.redAccent,
                      shape: BoxShape.circle, // Circle decoration for markers
                    ),
                    defaultDecoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300, width: 1),
                      borderRadius:
                          BorderRadius.circular(8), // Only use with rectangle
                      shape: BoxShape.rectangle, // Rectangle with borderRadius
                    ),
                    weekendDecoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300, width: 1),
                      borderRadius:
                          BorderRadius.circular(8), // Only use with rectangle
                      shape: BoxShape.rectangle, // Rectangle with borderRadius
                    ),
                    outsideDecoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade100, width: 2),
                      borderRadius:
                          BorderRadius.circular(8), // Only use with rectangle
                      shape: BoxShape.rectangle, // Rectangle with borderRadius
                    ),
                  ),
                  headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    titleTextStyle: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF002147), // Oxford Blue
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 5,
                          offset: const Offset(0, -4),
                        ),
                      ],
                    ),
                    child: _selectedDay != null &&
                            _getEventsForDay(_selectedDay!).isNotEmpty
                        ? ListView(
                            children: _getEventsForDay(_selectedDay!)
                                .map(
                                  (event) => Card(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 16.0,
                                      vertical: 8.0,
                                    ),
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: ListTile(
                                      title: Text(
                                        event['title']!,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color:
                                              Color(0xFF002147), // Oxford Blue
                                        ),
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              "Description: ${event['description']}"),
                                          Text(
                                              "Date: ${_selectedDay!.toLocal().toString().split(' ')[0]}"),
                                          Text("Time: ${event['time']}"),
                                          Text("Mode: ${event['mode']}"),
                                        ],
                                      ),
                                      leading: Icon(Icons.event,
                                          color: Colors.blue.shade700),
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        : Center(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                'No events for this day.',
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
              ],
          ),
        ),
      ),
    );
  }
}
