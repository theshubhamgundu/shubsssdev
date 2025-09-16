import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  final List<Map<String, dynamic>> notifications = [
    {
      'name': 'David Silva',
      'message': 'Invite to Malone London’s Mother’s',
      'time': 'Just now',
      'type': 'invite',
    },
    {
      'name': 'Adan Saif',
      'message': 'Started following you',
      'time': '2m ago',
      'type': 'follow',
    },
    {
      'name': 'Jean Baker',
      'message': 'Invite: A Virtual Evening of Smooth Jazz',
      'time': '20m ago',
      'type': 'invite',
    },
    {
      'name': 'Ronald K. Kinch',
      'message': 'Like you',
      'time': '1hr ago',
      'type': 'like',
    },
    {
      'name': 'Clian Tobon',
      'message': 'Join your Event: Goa Music Festival',
      'time': '5hr ago',
      'type': 'join',
    },
    {
      'name': 'Jennifer Fritz',
      'message': 'Invite: International Kids Safe',
      'time': 'Tue, 5:30 pm',
      'type': 'invite',
    },
    {
      'name': 'Eric G. Prickett',
      'message': 'Started following you',
      'time': 'Wed, 3:39 pm',
      'type': 'follow',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.deepPurple),
        title: Text('Notification', style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.deepPurple),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 16),
        itemCount: notifications.length,
        separatorBuilder: (_, __) => Divider(height: 1, color: Colors.grey[200]),
        itemBuilder: (context, index) {
          final n = notifications[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.deepPurple[100],
              child: Text(n['name'][0], style: TextStyle(color: Colors.deepPurple)),
            ),
            title: RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.black, fontSize: 15),
                children: [
                  TextSpan(text: n['name'], style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: ' ' + n['message']),
                ],
              ),
            ),
            subtitle: Text(n['time'], style: TextStyle(color: Colors.grey[500], fontSize: 13)),
            trailing: n['type'] == 'invite'
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Color(0xFFFF6B35)),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                        child: Text('Reject', style: TextStyle(color: Color(0xFFFF6B35))),
                      ),
                      SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFF6B35),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                        child: Text('Accept'),
                      ),
                    ],
                  )
                : n['type'] == 'follow'
                    ? ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFF6B35),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                        child: Text('Accept'),
                      )
                    : null,
          );
        },
      ),
    );
  }
}
