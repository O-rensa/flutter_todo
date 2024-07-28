import 'package:flutter/material.dart';
import 'package:todo_app/components/dialog_box.dart';
import '../components/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // text controller
  final _controller = TextEditingController();

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

  // save new task
  void saveNewTask() {
    setState(() {
      toDoList.add(
        [_controller.text, false]
      );
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  // create new task
  void createNewtask() {
    showDialog(
      context: context, 
      builder: (context) {
        return DialogBox(
          txController: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
          );
      });
  }

  void deleteTask(int idx) {
    setState(() {
      toDoList.removeAt(idx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text(
          style: TextStyle(
            color: Colors.white
          ),
          'TO DO APP'),
        elevation: 10,
      ),

      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1], 
            onChanged: (value) => checkBoxOnChanged(value, index),
            deleteFunc: (context) => deleteTask(index),
            );
        }),

      floatingActionButton: FloatingActionButton(
        onPressed: createNewtask,
        backgroundColor: Colors.green,
        child: const Icon(
            Icons.add,
            color: Colors.white
          )
        ),
    );
  }
}