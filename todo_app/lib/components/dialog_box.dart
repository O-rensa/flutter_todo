import 'package:flutter/material.dart';
import 'package:todo_app/components/alert_button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController txController;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.txController,
    required this.onSave,
    required this.onCancel
  });

  @override 
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.green[700],
      
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get user input
            TextField(
              controller: txController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.grey,
                border: OutlineInputBorder(),
                hintText: "Add a new Task",
              ),
            ),

            // buttons -> save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              // save button
              AlertButton(
                text: "Save", 
                onPressed: onSave,
                ),

              // cancel button
              AlertButton(
                text: "Cancel", 
                onPressed: onCancel,
                )

            ],)
          ],
        )
        ),

    );
  }
}