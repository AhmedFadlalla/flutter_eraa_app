import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/screens/todo_screen/cubit/to_do_state.dart';

import '../../../model/task_model.dart';


class ToDoCubit extends Cubit<ToDoState> {
  ToDoCubit() : super(ToDoInitial());


 static ToDoCubit get(context)=> BlocProvider.of(context);


 List<TaskModel> myTasks=[];

 var titleController=TextEditingController();
 var dateController=TextEditingController();
 var descriptionController=TextEditingController();
 var timeController=TextEditingController();

 void addTask(TaskModel data){

  myTasks.add(data);

  emit(AddTaskSuccessState());
 }


 void deleteControllerData(){
  dateController.text='';
  timeController.text='';
  titleController.text='';
  descriptionController.text='';
  emit(DeleteControllerSuccessState());
 }


  List<TaskModel> doneTasks=[];

 void addDoneTasks(int index){
  doneTasks.add(myTasks[index]);
  myTasks.removeAt(index);
  emit(AddDoneTaskSuccessState());
 }

 List<TaskModel> archiveTasks=[];


 void addArchiveTask(int index){
  archiveTasks.add(doneTasks[index]);
  doneTasks.removeAt(index);
  emit(AddArchiveTaskSuccessState());
 }


}
