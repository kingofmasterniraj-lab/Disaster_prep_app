import 'package:flutter/material.dart';

class DrillScreen extends StatelessWidget {
  final List<String> steps = [
    'Step 1: Stay calm and alert everyone.',
    'Step 2: Follow the emergency exit routes.',
    'Step 3: Assemble at the safe point.',
    'Step 4: Check everyone is accounted for.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Virtual Drill')),
      body: ListView.builder(
        itemCount: steps.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(12),
            child: ListTile(
              leading: CircleAvatar(child: Text('${index + 1}')),
              title: Text(steps[index]),
            ),
          );
        },
      ),
    );
  }
}
