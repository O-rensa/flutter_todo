import 'package:flutter/material.dart';
import '../components/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of todo tasks
  List toDoList = [
    ["Make Tutorial", false],
    ["Do Exercise", false],
  ];

  // checkbox was tapped
  void checkBoxOnChanged(bool? value, int idx) {
    setState(() {
      toDoList[idx][1] = !toDoList[idx][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green[300],
        title: const Text('TO DO'),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1], 
            onChanged: (value) => checkBoxOnChanged(value, index), 
            );
        })
    );
  }
}