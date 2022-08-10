import 'package:flutter/material.dart';
import 'package:sectodo/model/todo_class.dart';
// import 'package:intl/intl.dart';
import 'package:sectodo/widgets/inputwidgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Second Todo App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TodoModel> todos = [];
  final TextEditingController _text = TextEditingController();
  final TextEditingController _startTime = TextEditingController();
  final TextEditingController _endTime = TextEditingController();

  void addTodos() {
    int id = todos.length;
    int ids = id++;

    final newInstanceOfTodo =
        TodoModel(ids, _text.text, _startTime.text, _endTime.text);
    if (_text.text.isEmpty) {
      return;
    }
    if (_startTime.text.isEmpty) {
      return;
    }
    if (_endTime.text.isEmpty) {
      return;
    }
    Navigator.of(context).pop();
    setState(() {
      todos.add(newInstanceOfTodo);
      _text.clear();
      _startTime.clear();
      _endTime.clear();
    });
  }

  deleteTodo(int id) {
    setState(() {
      todos.removeWhere((todo) => todo.id == id);
    });
  }

  void showInputField(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return GestureDetector(
            onTap: null,
            behavior: HitTestBehavior.opaque,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 350,
                  child: TextField(
                    decoration: const InputDecoration(
                        labelText: 'Enter-Todo', hintText: 'To-do'),
                    controller: _text,
                    onSubmitted: (_) => addTodos(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        const Text('From :'),
                        SizedBox(
                          width: 60,
                          child: TextField(
                            decoration:
                                const InputDecoration(hintText: "00:00 Am"),
                            controller: _startTime,
                            onSubmitted: (_) => addTodos(),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Text('Till :'),
                        SizedBox(
                          width: 60,
                          child: TextField(
                            decoration:
                                const InputDecoration(hintText: "00:00 Am"),
                            controller: _endTime,
                            onSubmitted: (_) => addTodos(),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15.00),
                  child: TextButton(
                    
                    onPressed: addTodos,
                   child: const Text('Add To List')),
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My To-do'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UserInput(
              deletetodo: deleteTodo,
              todos: todos,
            ),
            FloatingActionButton(
                onPressed: () => showInputField(context),
                child: const Icon(Icons.add_task))
          ],
        ),
      ),
    );
  }
}
