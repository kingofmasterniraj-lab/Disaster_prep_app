import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  final List<Map<String, dynamic>> students = [
    {'name': 'Alice', 'score': 8},
    {'name': 'Bob', 'score': 6},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Dashboard')),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(12),
            child: ListTile(
              title: Text(students[index]['name']),
              trailing: Text('Score: ${students[index]['score']}'),
            ),
          );
        },
      ),
    );
  }
}
