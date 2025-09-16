import 'package:flutter/material.dart';

class CreateEventScreen extends StatefulWidget {
  @override
  _CreateEventScreenState createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _eventName, _location, _description;
  DateTime? _date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Event', style: TextStyle(color: Colors.deepPurple)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.deepPurple),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Event Name'),
                onSaved: (val) => _eventName = val,
                validator: (val) => val == null || val.isEmpty ? 'Enter event name' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: 'Location'),
                onSaved: (val) => _location = val,
                validator: (val) => val == null || val.isEmpty ? 'Enter location' : null,
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null) setState(() => _date = picked);
                },
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Date',
                      hintText: _date == null ? 'Select date' : _date!.toLocal().toString().split(' ')[0],
                    ),
                    validator: (val) => _date == null ? 'Select date' : null,
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
                onSaved: (val) => _description = val,
                validator: (val) => val == null || val.isEmpty ? 'Enter description' : null,
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Save event logic here
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Event Created!')));
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF6B35),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text('Create Event', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
