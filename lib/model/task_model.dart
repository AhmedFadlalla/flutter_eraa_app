class TaskModel{
  final String title;
  final String date;
  final String time;
   TaskState taskState;
  TaskModel({
    required this.title,required this.date,required this.time,
  this.taskState=TaskState.task});
}


enum TaskState{
  task,
  done,
  archive
}