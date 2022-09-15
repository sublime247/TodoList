import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sectodo/model/todo_class.dart';
import 'package:sectodo/model/todo_provider.dart';
// import 'package:intl/intl.dart';
import 'package:sectodo/widgets/inputwidgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Todos(),
      child: MaterialApp(
        title: 'Second Todo App',
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void showInputField(BuildContext context) {
    final provider = Provider.of<Todos>(context, listen: false);
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
                    controller: provider.text,
                    onSubmitted: (_) => provider.addTodos(),
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
                            controller: provider.startTime,
                            onSubmitted: (_) => provider.addTodos(),
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
                            controller: provider.endTime,
                            onSubmitted: (_) => provider.addTodos(),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15.00),
                  child: TextButton(
                      onPressed: () 

                      {  
                        provider.addTodos;
                        // Navigator.of(context).pop();
                      },
                      child: const Text('Add To List')),
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Todos>(context);
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
              deletetodo: provider.deleteTodo,
              todos: provider.todos,
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
