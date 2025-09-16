import 'package:flutter/material.dart';

class EditEventScreen extends StatefulWidget {
  final String eventName;
  final String location;
  final DateTime date;
  final String description;

  EditEventScreen({
    required this.eventName,
    required this.location,
    required this.date,
    required this.description,
  });

  @override
  _EditEventScreenState createState() => _EditEventScreenState();
}

class _EditEventScreenState extends State<EditEventScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _eventName, _location, _description;
  late DateTime _date;

  @override
  void initState() {
    super.initState();
    _eventName = widget.eventName;
    _location = widget.location;
    _date = widget.date;
    _description = widget.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Event', style: TextStyle(color: Colors.deepPurple)),
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
                initialValue: _eventName,
                decoration: InputDecoration(labelText: 'Event Name'),
                onSaved: (val) => _eventName = val ?? '',
                validator: (val) => val == null || val.isEmpty ? 'Enter event name' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                initialValue: _location,
                decoration: InputDecoration(labelText: 'Location'),
                onSaved: (val) => _location = val ?? '',
                validator: (val) => val == null || val.isEmpty ? 'Enter location' : null,
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: _date,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null) setState(() => _date = picked);
                },
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Date',
                      hintText: _date.toLocal().toString().split(' ')[0],
                    ),
                    validator: (val) => _date == null ? 'Select date' : null,
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                initialValue: _description,
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
                onSaved: (val) => _description = val ?? '',
                validator: (val) => val == null || val.isEmpty ? 'Enter description' : null,
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Save event logic here
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Event Updated!')));
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF6B35),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text('Save Changes', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
