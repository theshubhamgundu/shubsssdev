import 'package:flutter/material.dart';

class InviteFriendScreen extends StatelessWidget {
  final List<Map<String, dynamic>> friends = [
    {'name': 'Alex Lee', 'followers': 25},
    {'name': 'Michael Ulasi', 'followers': 56},
    {'name': 'Cristofer', 'followers': 30},
    {'name': 'David Fish', 'followers': 67},
    {'name': 'Ashfak Sayem', 'followers': 22},
    {'name': 'Rocka Walakjen', 'followers': 19},
    {'name': 'Roman Kutepov', 'followers': 52},
    {'name': 'Cristofer Nolan', 'followers': 37},
    {'name': 'Zamfora Bolox', 'followers': 41},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.deepPurple),
        title: Text('Invite Friend', style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                contentPadding: EdgeInsets.symmetric(vertical: 0),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: friends.length,
              separatorBuilder: (_, __) => Divider(height: 1, color: Colors.grey[200]),
              itemBuilder: (context, index) {
                final f = friends[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.deepPurple[100],
                    child: Text(f['name'][0], style: TextStyle(color: Colors.deepPurple)),
                  ),
                  title: Text(f['name'], style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('${f['followers']} Followers'),
                  trailing: Icon(Icons.check_circle, color: Color(0xFFFF6B35)),
                  onTap: () {},
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFF6B35),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                minimumSize: Size(double.infinity, 48),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('INVITE', style: TextStyle(fontSize: 16)),
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
