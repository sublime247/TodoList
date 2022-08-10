import 'package:flutter/material.dart';
import 'package:sectodo/model/todo_class.dart';
// import 'package:intl/intl.dart';

class UserInput extends StatelessWidget {
 const UserInput({Key? key, required this.todos, required this.deletetodo}) : super(key: key);
  final List<TodoModel> todos;
  final Function deletetodo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ListView.builder(
        itemCount: todos.length,
        itemBuilder: ((context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(todos[index].id.toString()),
                  Text(todos[index].todo),
                  Row(
                    children: [
                      Text(todos[index].startTime),
                      SizedBox(width: 20,),
                    const  Text('to'),
                      SizedBox(width: 20,),
                      Text(todos[index].endTime)
                    ],
                  ) ,
                 IconButton(onPressed:()=> deletetodo(todos[index].id), icon: const Icon(Icons.delete),color: Colors.red,)
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
