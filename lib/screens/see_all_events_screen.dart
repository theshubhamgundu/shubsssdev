import 'package:flutter/material.dart';

class SeeAllEventsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.deepPurple),
        title: Text('Events', style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list, color: Colors.deepPurple),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          _eventTile('International Band Music Concert', 'Music Concert', 'assets/event1.png'),
          _eventTile('Friendly Mini Football', 'Sports', 'assets/event2.png'),
          _eventTile('Art Gala', 'Art', 'assets/event3.png'),
          _eventTile('Tech Meetup', 'Tech', 'assets/event4.png'),
        ],
      ),
    );
  }

  Widget _eventTile(String title, String type, String imageAsset) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[200],
            image: DecorationImage(
              image: AssetImage(imageAsset),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(type, style: TextStyle(color: Color(0xFFFF6B35))),
        trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.deepPurple),
        onTap: () {},
      ),
    );
  }
}
