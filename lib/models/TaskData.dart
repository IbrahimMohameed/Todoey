import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todoey2/models/TaskModel.dart';

class TaskData extends ChangeNotifier {
  final List<TaskModel> _tasksList = [
    TaskModel(title: 'Buy Eggs'),
    TaskModel(title: 'Buy Bread'),
    TaskModel(title: 'Buy Botato'),
  ];

  int get tasksLength {
    return _tasksList.length;
  }

  UnmodifiableListView get tasksList {
    return UnmodifiableListView(_tasksList);
  }

  void changeList(String newTaskTitle) {
    final task = TaskModel(title: newTaskTitle);
    _tasksList.add(task);
    notifyListeners();
  }

  void updateTask(TaskModel task) {
    task.changeCheckState();
    notifyListeners();
  }

  void deleteTask(TaskModel task) {
    _tasksList.remove(task);
    notifyListeners();
  }
}
