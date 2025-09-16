import 'package:flutter/material.dart';

class TicketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.deepPurple),
        title: Text('Ticket', style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFFFF6B35),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  Text('International Band Music Concert', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                  SizedBox(height: 8),
                  Text('14 December, 2021', style: TextStyle(color: Colors.white70)),
                  SizedBox(height: 8),
                  Text('7:00PM - 9:00PM', style: TextStyle(color: Colors.white70)),
                  SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text('VISA 1234', style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontSize: 24)),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text('Scan QR for entry', style: TextStyle(color: Colors.white70)),
                  SizedBox(height: 8),
                  Container(
                    width: 80,
                    height: 80,
                    color: Colors.white,
                    child: Center(child: Icon(Icons.qr_code, size: 48, color: Colors.deepPurple)),
                  ),
                  SizedBox(height: 16),
                  Text('Ticket ID: 1234567890', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                minimumSize: Size(double.infinity, 48),
              ),
              child: Text('DOWNLOAD TICKET', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
