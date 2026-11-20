import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/task.dart';
import 'package:flutter_application_1/widgets/taskitem.dart';
import 'package:flutter_application_1/completedtaskpage.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int cnt = 0;
  List<Task> mylists = [
    Task(title: 'Task1'),
    Task(title: 'Task2'),
    Task(title: 'Task3'),
    Task(title: 'Task4'),
    Task(title: 'Task5'),



  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Tasks'),
      ),
      body: Center(
        
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: mylists.length,
                itemBuilder: (context, index) {
                  return TaskItem(
                    title: mylists[index].title,
                    iscomplete: mylists[index].iscomplete,
                    onChanched: (value) {
                      setState(() {
                        bool isChecked = value ?? false;
                        mylists[index].iscomplete = isChecked;
                        if (isChecked) {
                          cnt++;
                        } else {
                          cnt--;
                        }
                        
                      });
                    },
                  );
                },
              ),
            ),

            ElevatedButton(onPressed:(){
            final completedTasks =
        mylists.where((task) => task.iscomplete).toList();
            Navigator.push(context, MaterialPageRoute(builder: (context)=>CompletedtasksPage(completedTasks: completedTasks,)));
            },
            child: Text('Completed Task Page' ,style: TextStyle(fontSize: 14),selectionColor: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('Completed Tasks : $cnt / ${mylists.length}'),
            ),
            SizedBox(height: 40),

          ],
        ),
      ),
    );
  }
}