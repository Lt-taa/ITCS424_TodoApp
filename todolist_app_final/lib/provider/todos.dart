import 'package:flutter/cupertino.dart';
import 'package:todolist_app_final/model/todo.dart';

//examples database
class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(
      createdTime: DateTime.now(),
      title: 'Go shopping 🛍',
      description: '''- buy some eggs and milk
- buy new cloth''',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Reads some books 📚',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Do homework 📝',
      description: '''- Wireless flutter application
- Wireless final 
- Wireless presentation (ppt)''',
    )
  ];

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();

  List<Todo> get todosCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();

  void addTodo(Todo todo) {
    _todos.add(todo);

    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);

    notifyListeners();
  }

  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();

    return todo.isDone;
  }

  void updateTodo(Todo todo, String title, String description) {
    todo.title = title;
    todo.description = description;

    notifyListeners();
  }
}
