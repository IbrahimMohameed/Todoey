class TaskModel {
  final String title;
  bool checkBoxDecision;

  TaskModel({this.title, this.checkBoxDecision = false});

  void changeCheckState() {
    checkBoxDecision = !checkBoxDecision;
  }
}
