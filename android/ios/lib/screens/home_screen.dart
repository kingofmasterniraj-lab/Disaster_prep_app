import 'package:flutter/material.dart';
import 'module_screen.dart';
import 'quiz_screen.dart';
import 'drill_screen.dart';
import 'admin_dashboard.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Disaster Preparedness')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Add your image at the top
            Image.asset(
              'assets/images/Disaster.jpg',
              width: double.infinity,
              height: 180,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),

            // Add your icon below the image
            IconButton(
              icon: Image.asset('assets/icons/Dicon.png'),
              iconSize: 60,
              onPressed: () {
                print('Icon pressed!');
              },
            ),
            SizedBox(height: 24),

            // Existing navigation buttons
            ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => ModuleScreen())),
              child: Text('Learning Modules'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => QuizScreen())),
              child: Text('Quizzes'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => DrillScreen())),
              child: Text('Virtual Drills'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => AdminDashboard())),
              child: Text('Admin Dashboard'),
            ),
          ],
        ),
      ),
    );
  }
}
