import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import '../model/todo.dart';

class TodoProvider with ChangeNotifier {
  final List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  void addTodo(String title) {
    final todo = Todo(
      id: const Uuid().v4(),
      title: title,
    );
    _todos.add(todo);
    notifyListeners();
  }

  void removeTodoById(String id) {
    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }

  void toggleTodoCompleted(String id) {
    final todoIndex = _todos.indexWhere((todo) => todo.id == id);
    final todo = _todos[todoIndex];
    _todos[todoIndex] = Todo(
      id: todo.id,
      title: todo.title,
      completed: !todo.completed,
    );
    notifyListeners();
  }
}
