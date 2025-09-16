import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.deepPurple),
        title: Text('Search', style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold)),
        actions: [
          Switch(value: true, onChanged: (v) {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search events',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              ),
            ),
            SizedBox(height: 24),
            Expanded(
              child: ListView(
                children: [
                  _searchResultTile('International Band Music Concert', 'Music Concert', 'assets/event1.png'),
                  _searchResultTile('Friendly Mini Football', 'Sports', 'assets/event2.png'),
                  _searchResultTile('Art Gala', 'Art', 'assets/event3.png'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _searchResultTile(String title, String type, String imageAsset) {
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
