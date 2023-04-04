import 'package:flutter/material.dart';

import '../../model/todo.dart';

class ListTodo extends StatelessWidget {
  final List<Todo> todos;
  final Function(String) onRemove;
  final Function(String) onToggle;

  const ListTodo(
      {Key? key,
      required this.todos,
      required this.onRemove,
      required this.onToggle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Todo> incompleteTodos =
        todos.where((todo) => !todo.completed).toList();
    final List<Todo> completeTodos =
        todos.where((todo) => todo.completed).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Text(
            'Incomplete Todo',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        incompleteTodos.isEmpty
            ? const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text('No incomplete todos'),
              )
            : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: incompleteTodos.length,
                itemBuilder: (BuildContext context, int index) {
                  final todo = incompleteTodos[index];
                  return Dismissible(
                    key: Key(todo.id),
                    onDismissed: (_) => onRemove(todo.id),
                    child: ListTile(
                      title: Text(
                        todo.title,
                        style: TextStyle(
                          decoration: todo.completed
                              ? TextDecoration.lineThrough
                              : null,
                          fontStyle: todo.completed
                              ? FontStyle.italic
                              : FontStyle.normal,
                          fontWeight: todo.completed
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                      leading: Checkbox(
                        value: todo.completed,
                        onChanged: (_) => onToggle(todo.id),
                      ),
                    ),
                  );
                },
              ),
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Text(
            'Completed Todo',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        completeTodos.isEmpty
            ? const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text('No completed todos'),
              )
            : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: completeTodos.length,
                itemBuilder: (BuildContext context, int index) {
                  final todo = completeTodos[index];
                  return ListTile(
                    title: Text(
                      todo.title,
                      style: TextStyle(
                        decoration:
                            todo.completed ? TextDecoration.lineThrough : null,
                        fontStyle: todo.completed
                            ? FontStyle.italic
                            : FontStyle.normal,
                        fontWeight: todo.completed
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                    leading: Checkbox(
                      value: todo.completed,
                      onChanged: (_) => onToggle(todo.id),
                    ),
                  );
                },
              ),
      ],
    );
  }
}
