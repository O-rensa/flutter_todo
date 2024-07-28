import 'package:hive/hive.dart';

class ToDoDataBase {
  List toDoList = [];

  // reference our box
  final _box = Hive.box("ToDoApp");

  // run this method if this is the first time opening this app
  void createInitialData() {
    toDoList = [
      ["Make Tutorial", false],
      ["Do Exercise", false],
    ];
  }

  // load the data from the database
  void loadData() {
    toDoList = _box.get("TODOLIST");
  }

  // update the database
  void updateDataBase() {
    _box.put("TODOLIST", toDoList);
  }
}