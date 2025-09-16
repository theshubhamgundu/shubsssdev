import 'package:flutter/material.dart';

class ScanCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.deepPurple),
        title: Text('Scan Card', style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 260,
              height: 160,
              decoration: BoxDecoration(
                color: Colors.deepPurple[100],
                borderRadius: BorderRadius.circular(24),
              ),
              child: Center(
                child: Icon(Icons.credit_card, size: 64, color: Colors.deepPurple),
              ),
            ),
            SizedBox(height: 32),
            Text('Scan your card', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 8),
            Text('Hold your card near the camera to scan', style: TextStyle(color: Colors.grey[600], fontSize: 15)),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFF6B35),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                minimumSize: Size(200, 48),
              ),
              child: Text('SCAN CARD', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
