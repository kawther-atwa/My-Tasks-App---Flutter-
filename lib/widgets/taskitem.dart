import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  final String title;
  final bool iscomplete;
  final Function(bool?) onChanched;

  const TaskItem({
    super.key,
    required this.title,
    required this.iscomplete,
    required this.onChanched,
  });
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(title),
      value: iscomplete,
      onChanged: onChanched
    );
 
  }
}
