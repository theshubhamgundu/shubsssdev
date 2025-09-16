import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _selectedMethod = 'Card';
  bool _saveCard = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.deepPurple),
        title: Text('Payment', style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Payment Method', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 16),
            Row(
              children: [
                _methodButton('Card'),
                SizedBox(width: 12),
                _methodButton('UPI'),
                SizedBox(width: 12),
                _methodButton('Netbanking'),
              ],
            ),
            SizedBox(height: 24),
            if (_selectedMethod == 'Card') _cardForm(),
            if (_selectedMethod == 'UPI') _upiForm(),
            if (_selectedMethod == 'Netbanking') _netbankingForm(),
            SizedBox(height: 24),
            Row(
              children: [
                Checkbox(
                  value: _saveCard,
                  onChanged: (val) => setState(() => _saveCard = val ?? false),
                ),
                Text('Save card for future payments'),
              ],
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFF6B35),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                minimumSize: Size(double.infinity, 48),
              ),
              child: Text('PAY NOW', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _methodButton(String method) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => setState(() => _selectedMethod = method),
        style: ElevatedButton.styleFrom(
          backgroundColor: _selectedMethod == method ? Color(0xFFFF6B35) : Colors.grey[200],
          foregroundColor: _selectedMethod == method ? Colors.white : Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        child: Text(method),
      ),
    );
  }

  Widget _cardForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          decoration: InputDecoration(labelText: 'Card Number'),
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(labelText: 'Expiry Date'),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: TextField(
                decoration: InputDecoration(labelText: 'CVV'),
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        TextField(
          decoration: InputDecoration(labelText: 'Cardholder Name'),
        ),
      ],
    );
  }

  Widget _upiForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          decoration: InputDecoration(labelText: 'UPI ID'),
        ),
      ],
    );
  }

  Widget _netbankingForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          decoration: InputDecoration(labelText: 'Bank Name'),
        ),
        SizedBox(height: 12),
        TextField(
          decoration: InputDecoration(labelText: 'Account Number'),
        ),
      ],
    );
  }
}
