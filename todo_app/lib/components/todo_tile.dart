import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunc;

  const ToDoTile({
    super.key, 
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunc,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:25.0, right: 25.0, top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunc,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
              )
          ],
          ),

        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(12),
          ),
        
          child:  Row(
            children: [
              // check box
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
                ),
        
              // task name
              Text(
                style: TextStyle(
                  color: Colors.white,
                  decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                ),
                taskName),
            ]
          )
        ),
      ),
    );
  }
}