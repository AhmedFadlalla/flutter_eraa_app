import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/model/task_model.dart';
import 'package:flutter_test_app/screens/todo_screen/cubit/todo_state.dart';
import 'package:meta/meta.dart';



class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());


  static TodoCubit get(context)=>BlocProvider.of(context);


  var titleController=TextEditingController();
  var dateController=TextEditingController();
  var timeController=TextEditingController();

  var formKey=GlobalKey<FormState>();
  List<TaskModel> tasks=[];

  void addTask({
  required TaskModel task}){
    tasks.add(task);

    emit(AddTaskSuccessState());
  }
  void clearAllData(){
    titleController.text='';
    dateController.text='';
    timeController.text='';
    emit(ClearAllDataSuccessState());
  }



List<TaskModel> done=[];
  void addDoneTask(index){
    done.add(tasks[index]);
    tasks.removeAt(index);
    emit(AddDoneTaskSuccessState());
  }

  void getDoneTasks(){
    done=[];
    tasks.forEach((element) {
      if(element.taskState==TaskState.done){
        done.add(element);
      }
    });
    emit(GetDoneTasksSuccessState());
  }

}
