import 'package:flutter/material.dart';

class ModuleScreen extends StatelessWidget {
  final List<Map<String, String>> modules = [
    {'title': 'Earthquake', 'content': 'Steps to stay safe during an earthquake...'},
    {'title': 'Flood', 'content': 'Steps to stay safe during a flood...'},
    {'title': 'Fire', 'content': 'Steps to stay safe during a fire...'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Learning Modules')),
      body: ListView.builder(
        itemCount: modules.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(12),
            child: ListTile(
              title: Text(modules[index]['title']!),
              subtitle: Text(modules[index]['content']!),
            ),
          );
        },
      ),
    );
  }
}
