import 'package:flutter/material.dart';

class OrganizerProfileScreen extends StatefulWidget {
  @override
  _OrganizerProfileScreenState createState() => _OrganizerProfileScreenState();
}

class _OrganizerProfileScreenState extends State<OrganizerProfileScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.deepPurple),
        title: Text('Organizer', style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          SizedBox(height: 24),
          // Profile Info
          CircleAvatar(
            radius: 44,
            backgroundImage: AssetImage('assets/avatar.png'),
          ),
          SizedBox(height: 16),
          Text('Tarun Bhum', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
          SizedBox(height: 4),
          Text('Organizer', style: TextStyle(color: Colors.grey[600], fontSize: 15)),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _profileStat('3,500', 'Followers'),
              Container(width: 1, height: 32, color: Colors.grey[300]),
              _profileStat('25', 'Events'),
              Container(width: 1, height: 32, color: Colors.grey[300]),
              _profileStat('2,100', 'Following'),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF6B35),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: Text('Follow'),
              ),
              SizedBox(width: 16),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Color(0xFFFF6B35)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: Text('Join', style: TextStyle(color: Color(0xFFFF6B35))),
              ),
            ],
          ),
          SizedBox(height: 24),
          // Tabs
          TabBar(
            controller: _tabController,
            labelColor: Color(0xFFFF6B35),
            unselectedLabelColor: Colors.grey,
            indicatorColor: Color(0xFFFF6B35),
            tabs: [
              Tab(text: 'Events'),
              Tab(text: 'Followers'),
              Tab(text: 'Following'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _eventsTab(),
                _followersTab(),
                _followingTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _profileStat(String value, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(height: 2),
          Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
        ],
      ),
    );
  }

  Widget _eventsTab() {
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        _eventCard('Design Conference 2022', 'assets/event1.png'),
        _eventCard('Christmas Dinner 2022', 'assets/event2.png'),
      ],
    );
  }

  Widget _followersTab() {
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        _userTile('Michael Levi', 'assets/avatar.png'),
        _userTile('Ricky & Victoria', 'assets/avatar.png'),
      ],
    );
  }

  Widget _followingTab() {
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        _userTile('Michael Levi', 'assets/avatar.png'),
        _userTile('Ricky & Victoria', 'assets/avatar.png'),
      ],
    );
  }

  Widget _eventCard(String title, String imageAsset) {
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
        trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.deepPurple),
        onTap: () {},
      ),
    );
  }

  Widget _userTile(String name, String imageAsset) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(imageAsset),
      ),
      title: Text(name, style: TextStyle(fontWeight: FontWeight.w500)),
      trailing: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFFF6B35),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: Text('Follow'),
      ),
    );
  }
}
