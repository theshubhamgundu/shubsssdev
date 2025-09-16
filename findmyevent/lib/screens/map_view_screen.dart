import 'package:flutter/material.dart';

class MapViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.deepPurple),
        title: Text('Map View', style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold)),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.grey[200],
            child: Center(
              child: Icon(Icons.map, size: 120, color: Colors.deepPurple.withOpacity(0.2)),
            ),
          ),
          Positioned(
            top: 24,
            left: 24,
            right: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _mapFilterButton(Icons.event, 'All'),
                _mapFilterButton(Icons.music_note, 'Music'),
                _mapFilterButton(Icons.sports_soccer, 'Sports'),
                _mapFilterButton(Icons.work, 'Work'),
              ],
            ),
          ),
          // Example event markers
          Positioned(
            left: 100,
            top: 200,
            child: _eventMarker(),
          ),
          Positioned(
            right: 100,
            bottom: 200,
            child: _eventMarker(),
          ),
        ],
      ),
    );
  }

  Widget _mapFilterButton(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(icon, color: Colors.deepPurple),
        ),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _eventMarker() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Color(0xFFFF6B35),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white, width: 3),
      ),
      child: Icon(Icons.location_on, color: Colors.white),
    );
  }
}
