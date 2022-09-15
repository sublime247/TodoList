import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sectodo/model/todo_class.dart';

class Todos with ChangeNotifier {
  List<TodoModel> todos = [];
  final TextEditingController text = TextEditingController();
  final TextEditingController startTime = TextEditingController();
  final TextEditingController endTime = TextEditingController();

  // late BuildContext context;

  void addTodos() {
    int id = todos.length;
    int ids = id++;

    final newInstanceOfTodo =
        TodoModel(ids, text.text, startTime.text, endTime.text);
    if (text.text.isEmpty) {
      return;
    }
    if (startTime.text.isEmpty) {
      return;
    }
    if (endTime.text.isEmpty) {
      return;
    }
    Navigator.pop;

    todos.add(newInstanceOfTodo);
    text.clear();
    startTime.clear();
    endTime.clear();
    notifyListeners();
  }

  deleteTodo(int id) {
    todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }
}
