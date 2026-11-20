import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/task.dart';


class CompletedtasksPage extends StatelessWidget {
  final List<Task> completedTasks;
  const CompletedtasksPage({super.key, required this.completedTasks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (title: Text('Completed Tasks'),),
        body: completedTasks.isEmpty
          ? const Center(
              child: Text('No completed tasks yet'),
            )
          : ListView.builder(
              itemCount: completedTasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.check_box, color: Colors.green),
                  title: Text(completedTasks[index].title),
                );
              },
            ),
    
    );
    
  }
}

