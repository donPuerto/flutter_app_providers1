import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/todo/add_form_todo.dart';
import '../components/todo/list_todo.dart';
import '../providers/todo_provider.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AddTodoForm(),
          const SizedBox(height: 16),
          Expanded(
            child: Consumer<TodoProvider>(
              builder: (context, provider, child) {
                final todos = provider.todos;
                return ListTodo(
                  todos: todos,
                  onRemove: provider.removeTodoById,
                  onToggle: provider.toggleTodoCompleted,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
