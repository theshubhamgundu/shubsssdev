import 'package:flutter/material.dart';

class ShareBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Share with friends', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ],
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _shareIcon(Icons.link, 'Copy Link'),
              _shareIcon(Icons.whatsapp, 'WhatsApp'),
              _shareIcon(Icons.facebook, 'Facebook'),
              _shareIcon(Icons.messenger, 'Messenger'),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _shareIcon(Icons.twitter, 'Twitter'),
              _shareIcon(Icons.camera_alt, 'Instagram'),
              _shareIcon(Icons.phone, 'Skype'),
              _shareIcon(Icons.message, 'Message'),
            ],
          ),
          SizedBox(height: 24),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('CANCEL', style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _shareIcon(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[200],
          child: Icon(icon, color: Colors.deepPurple),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
