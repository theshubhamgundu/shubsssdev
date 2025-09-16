import 'package:flutter/material.dart';

class EmptyNotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.deepPurple),
        title: Text('Notification', style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Icon(Icons.notifications_none, size: 100, color: Colors.grey[300]),
              SizedBox(height: 32),
              Text('No Notifications!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
              SizedBox(height: 12),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[600], fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
