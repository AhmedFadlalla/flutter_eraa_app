class TaskModel{
  final String title;
  final String date;
  final String time;

  TaskModel({
    required this.title,required this.date,required this.time,
});
}


enum TaskState{
  task,
  done,
  archive
}