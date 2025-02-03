import 'package:flutter/material.dart';

class EventHeader extends StatelessWidget {
  final String eventName;
  final String eventDate;

  // Constructor to initialize the values of eventName and eventDate
  const EventHeader({
    super.key,
    required this.eventName,
    required this.eventDate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header with event name and event date
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                eventName,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                eventDate,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ),
        // Divider to separate header from content
        Divider(
          thickness: 1,
          color: Colors.grey.shade300,
          indent: 16.0,
          endIndent: 16.0,
        ),
      ],
    );
  }
}

