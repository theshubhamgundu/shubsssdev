import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../data/mock_events.dart';
import '../data/mock_community.dart';
import '../data/mock_profiles.dart';
import '../data/mock_notifications.dart';
import 'menu_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final _supabase = Supabase.instance.client;

  List<Widget> _sections(BuildContext context) => [
    // Explore Page
    StreamBuilder<List<Map<String, dynamic>>>(
      stream: _supabase
        .from('events')
        .stream(primaryKey: ['id'])
        .order('created_at')
        .map((data) => data as List<Map<String, dynamic>>),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error loading events'));
        }
        var events = snapshot.data ?? [];
        if (events.isEmpty) events = mockEvents;

        // Filter events by selected interests (for demo, hardcoded interests)
        final selectedInterests = ['Fest', 'Technical'];
        events = events.where((e) => selectedInterests.contains(e['type'])).toList();
        final trending = events.where((e) => (e['is_trending'] ?? false)).toList();
        return ListView(
          padding: EdgeInsets.all(20),
          children: [
            Text('Explore Events', style: Theme.of(context).textTheme.headlineLarge),
            SizedBox(height: 16),
            if (trending.isNotEmpty) ...[
              Text('Trending', style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Theme.of(context).colorScheme.primary)),
              SizedBox(height: 8),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: trending.length,
                  separatorBuilder: (_, __) => SizedBox(width: 16),
                  itemBuilder: (context, i) => TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.8, end: 1.0),
                    duration: Duration(milliseconds: 600 + i * 100),
                    curve: Curves.elasticOut,
                    builder: (context, scale, child) => Transform.scale(
                      scale: scale,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Theme.of(context).colorScheme.primary, Theme.of(context).colorScheme.secondary],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(28),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).colorScheme.primary.withOpacity(0.18),
                              blurRadius: 18,
                              offset: Offset(0, 8),
                            ),
                          ],
                        ),
                        child: SizedBox(
                          width: 160,
                          child: _eventCard(context, trending[i]['title'] ?? '', trending[i]['date'] ?? '', trending[i]['type'] ?? '', trending[i]['image'] ?? 'assets/event1.png', animated: true),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),
            ],
            Text('All Events', style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(height: 8),
            ...events.map((event) => _eventCard(context, event['title'] ?? '', event['date'] ?? '', event['type'] ?? '', event['image'] ?? 'assets/event1.png', animated: false)).toList(),
            if (events.isEmpty)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 32),
                child: Center(child: Text('No events found for your interests.', style: TextStyle(color: Colors.grey, fontSize: 18))),
              ),
          ],
        );
      },
    ),
    // Events Section (dedicated)
    StreamBuilder<List<Map<String, dynamic>>>(
      stream: _supabase
        .from('events')
        .stream(primaryKey: ['id'])
        .order('created_at')
        .map((data) => data as List<Map<String, dynamic>>),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error loading events'));
        }
        var events = snapshot.data ?? [];
        if (events.isEmpty) events = mockEvents;
        return ListView(
          padding: EdgeInsets.all(20),
          children: [
            Text('Events', style: Theme.of(context).textTheme.headlineLarge),
            SizedBox(height: 16),
            ...events.map((event) => TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.8, end: 1.0),
              duration: Duration(milliseconds: 500),
              curve: Curves.easeOutBack,
              builder: (context, scale, child) => Transform.scale(
                scale: scale,
                child: _eventCard(context, event['title'] ?? '', event['date'] ?? '', event['type'] ?? '', event['image'] ?? 'assets/event1.png', animated: true),
              ),
            )).toList(),
          ],
        );
      },
    ),
    // Community Section
    StreamBuilder<List<Map<String, dynamic>>>(
      stream: _supabase
        .from('community')
        .stream(primaryKey: ['id'])
        .order('created_at')
        .map((data) => data as List<Map<String, dynamic>>),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error loading community'));
        }
        var community = snapshot.data ?? [];
        if (community.isEmpty) community = mockCommunity;
        return ListView(
          padding: EdgeInsets.all(20),
          children: [
            Text('Community', style: Theme.of(context).textTheme.headlineLarge),
            SizedBox(height: 16),
            ...community.map((member) => AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              margin: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Theme.of(context).colorScheme.primary.withOpacity(0.10), Theme.of(context).colorScheme.secondary.withOpacity(0.10)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.08),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  child: Text(member['name']?[0] ?? '?', style: TextStyle(color: Colors.white)),
                ),
                title: Text(member['name'] ?? '', style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
                subtitle: Text(member['role'] ?? '', style: Theme.of(context).textTheme.bodyMedium),
                trailing: Icon(Icons.chat_bubble, color: Theme.of(context).colorScheme.primary),
                onTap: () {
                  // TODO: Add animated navigation to chat/member details
                },
              ),
            )).toList(),
          ],
        );
      },
    ),
    // Profile Section
    StreamBuilder<List<Map<String, dynamic>>>(
      stream: _supabase
        .from('profiles')
        .stream(primaryKey: ['id'])
        .order('created_at')
        .map((data) => data as List<Map<String, dynamic>>),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error loading profile'));
        }
        var profiles = snapshot.data ?? [];
        if (profiles.isEmpty) profiles = mockProfiles;
        final profile = profiles.isNotEmpty ? profiles[0] : null;
        if (profile == null) return Center(child: Text('No profile found'));
        return Padding(
          padding: EdgeInsets.all(20),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 600),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Theme.of(context).colorScheme.primary.withOpacity(0.10), Theme.of(context).colorScheme.secondary.withOpacity(0.10)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.10),
                  blurRadius: 12,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(radius: 40, backgroundColor: Theme.of(context).colorScheme.secondary, child: Text(profile['name']?[0] ?? '?', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold))),
                    SizedBox(width: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(profile['name'] ?? '', style: Theme.of(context).textTheme.headlineMedium),
                        Text(profile['email'] ?? '', style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Text('Role: ${profile['role'] ?? ''}', style: Theme.of(context).textTheme.bodyLarge),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Add animated navigation to edit profile
                  },
                  child: Text('Edit Profile'),
                ),
              ],
            ),
          ),
        );
      },
    ),
    // Notification Section
    StreamBuilder<List<Map<String, dynamic>>>(
      stream: _supabase
        .from('notifications')
        .stream(primaryKey: ['id'])
        .order('created_at')
        .map((data) => data as List<Map<String, dynamic>>),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error loading notifications'));
        }
        var notifications = snapshot.data ?? [];
        if (notifications.isEmpty) notifications = mockNotifications;
        return ListView(
          padding: EdgeInsets.all(20),
          children: [
            Text('Notifications', style: Theme.of(context).textTheme.headlineLarge),
            SizedBox(height: 16),
            ...notifications.map((notif) => AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              margin: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Theme.of(context).colorScheme.primary.withOpacity(0.10), Theme.of(context).colorScheme.secondary.withOpacity(0.10)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.08),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ListTile(
                leading: Icon(Icons.notifications, color: Theme.of(context).colorScheme.secondary),
                title: Text(notif['title'] ?? '', style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
                subtitle: Text(notif['message'] ?? '', style: Theme.of(context).textTheme.bodyMedium),
                trailing: Icon(Icons.arrow_forward_ios, color: Theme.of(context).colorScheme.primary),
                onTap: () {
                  // TODO: Add animated navigation to notification details
                },
              ),
            )).toList(),
          ],
        );
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.deepPurple),
        title: Text('FindMyEvent', style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold)),
      ),
      body: _sections(context)[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFFF6B35),
        unselectedItemColor: Colors.grey[400],
        onTap: (index) => setState(() => _selectedIndex = index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Events'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Community'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
        ],
      ),
    );
  }

  Widget _eventCard(BuildContext context, String title, String date, String type, String imageAsset, {bool animated = false}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: animated ? 600 : 300),
      curve: Curves.easeInOut,
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Theme.of(context).colorScheme.primary.withOpacity(0.12), Theme.of(context).colorScheme.secondary.withOpacity(0.12)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.08),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: Hero(
          tag: title,
          child: Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
              image: DecorationImage(
                image: imageAsset.startsWith('http') ? NetworkImage(imageAsset) : AssetImage(imageAsset) as ImageProvider,
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.secondary.withOpacity(0.18),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
          ),
        ),
        title: Text(title, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4),
            Text(date, style: Theme.of(context).textTheme.bodyMedium),
            Text(type, style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: 13, fontWeight: FontWeight.w600)),
          ],
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Theme.of(context).colorScheme.primary),
        onTap: () {
          // TODO: Add animated navigation to event details
        },
      ),
    );
  }
}
