import 'package:flutter/material.dart';

class EventDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.deepPurple),
        title: Text('Event Details', style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        padding: EdgeInsets.all(24),
        children: [
          // Event Image
          Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              image: DecorationImage(
                image: AssetImage('assets/event1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 24),
          Text('International Band Music Concert', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.calendar_today, size: 18, color: Colors.deepPurple),
              SizedBox(width: 8),
              Text('Sat, 12 March', style: TextStyle(color: Colors.grey[600])),
              SizedBox(width: 16),
              Icon(Icons.location_on, size: 18, color: Colors.deepPurple),
              SizedBox(width: 8),
              Text('London Music Center', style: TextStyle(color: Colors.grey[600])),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage('assets/avatar.png'),
              ),
              SizedBox(width: 12),
              Text('Aditya Saxen', style: TextStyle(fontWeight: FontWeight.w500)),
              SizedBox(width: 8),
              Text('Organizer', style: TextStyle(color: Colors.grey[500], fontSize: 13)),
            ],
          ),
          SizedBox(height: 24),
          Text('About Event', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(height: 8),
          Text('Join us for an unforgettable night of music and fun! Enjoy live performances by top bands and artists. Food and drinks available.', style: TextStyle(color: Colors.grey[700], fontSize: 15)),
          SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFF6B35),
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('BUY TICKET 500₹', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward, size: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
