import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_app_final/provider/todos.dart';
import 'package:todolist_app_final/widget/todo_widget.dart';

//check page widget
class CompletedListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todosCompleted;

    return todos.isEmpty
        ? Center(
      child: Text(
        'No completed tasks.',
        style: TextStyle(fontSize: 20),
      ),
    )
        : ListView.separated(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(16),
      separatorBuilder: (context, index) => Container(height: 8),
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];

        return TodoWidget(todo: todo);
      },
    );
  }
}