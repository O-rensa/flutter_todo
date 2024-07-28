import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/components/dialog_box.dart';
import 'package:todo_app/data/database.dart';
import '../components/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference the hive box
  final _box = Hive.box("toDoApp");
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {

    if (_box.get("TODOLIST") == null) {
      // if this is the first time opening the app, create the default data
      db.createInitialData();
    } else {
      // there already exist data
      db.loadData();
    }

    super.initState();
  }


  // text controller
  final _controller = TextEditingController();

  // checkbox was tapped
  void checkBoxOnChanged(bool? value, int idx) {
    setState(() {
      db.toDoList[idx][1] = !db.toDoList[idx][1];
    });
    db.loadData();
  }

  // save new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add(
        [_controller.text, false]
      );
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
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

  // delete a task
  void deleteTask(int idx) {
    setState(() {
      db.toDoList.removeAt(idx);
    });
    db.updateDataBase();
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
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1], 
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