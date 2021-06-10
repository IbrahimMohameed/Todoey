import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey2/models/TaskData.dart';
import 'package:todoey2/models/TaskModel.dart';
import 'package:todoey2/screens/AddTask.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              height: 190.0,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30.0,
                      child: Icon(
                        Icons.list,
                        size: 40.0,
                      ),
                    ),
                  ),
                  Text(
                    'Todoey',
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${Provider.of<TaskData>(context).tasksLength} Tasks',
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0),
                  ),
                ),
                child: Consumer<TaskData>(
                  builder: (context, taskdata, child) {
                    return ListView.builder(
                      itemCount: taskdata.tasksLength,
                      itemBuilder: (BuildContext context, int index) {
                        final task = taskdata.tasksList[index];
                        return ListTile(
                          onLongPress: () {
                            return showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                    'Are You Sure You Completed This Task ? ',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.lightBlueAccent,
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateColor.resolveWith(
                                                (states) => Colors.red),
                                      ),
                                      onPressed: () {
                                        taskdata.deleteTask(task);
                                        Navigator.pop(context);
                                      },
                                      child: Text('Delete'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          title: Text(
                            task.title,
                            style: task.checkBoxDecision
                                ? TextStyle(
                                    decoration: TextDecoration.lineThrough)
                                : null,
                          ),
                          trailing: Checkbox(
                            activeColor: Colors.lightBlueAccent,
                            value: task.checkBoxDecision,
                            onChanged: (value) {
                              taskdata.updateTask(task);
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return AddTaskScreen();
            },
          );
        },
        child: Icon(
          Icons.add,
          size: 28.0,
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
    );
  }
}
