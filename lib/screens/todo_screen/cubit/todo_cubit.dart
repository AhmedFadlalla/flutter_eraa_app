import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/model/task_model.dart';
import 'package:flutter_test_app/screens/todo_screen/cubit/todo_state.dart';
import 'package:meta/meta.dart';
class DataModel {
  List<Data>? data;

  DataModel({this.data});

  DataModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? name;
  int? moneyBudget;
  int? moneyLeft;
  List<Transactions>? transactions;

  Data({this.name, this.moneyBudget, this.moneyLeft, this.transactions});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    moneyBudget = json['money_budget'];
    moneyLeft = json['money_left'];
    if (json['transactions'] != null) {
      transactions = <Transactions>[];
      json['transactions'].forEach((v) {
        transactions!.add(new Transactions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['money_budget'] = this.moneyBudget;
    data['money_left'] = this.moneyLeft;
    if (this.transactions != null) {
      data['transactions'] = this.transactions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Transactions {
  String? name;
  double? value;

  Transactions({this.name, this.value});

  Transactions.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    return data;
  }
}


class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());






  static TodoCubit get(context)=>BlocProvider.of(context);


  var titleController=TextEditingController();
  var dateController=TextEditingController();
  var timeController=TextEditingController();

  var formKey=GlobalKey<FormState>();



  List<TaskModel> tasks=[];


  void addTask({
  required TaskModel taskModel
}){
    tasks.add(taskModel);
    emit(AddTaskSuccessState());
  }
  void clearAllData(){
    titleController.text='';
    dateController.text='';
    timeController.text='';
    emit(ClearAllDataSuccessState());
  }


  List<TaskModel> done=[];

  void addDoneTask({
  required int index
}){

    done.add(tasks[index]);
    tasks.removeAt(index);
    emit(AddDoneTaskSuccessState());
  }


  List<TaskModel> archive=[];

  void addArchiveTask({
    required int index
  }){

    archive.add(done[index]);
    done.removeAt(index);
    emit(AddArchiveTaskSuccessState());
  }

}
