class Task {
  final String title;
  bool isDone;
  final String date;

  Task({required this.title, required this.date, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}