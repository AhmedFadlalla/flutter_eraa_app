import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';
import '../model/note_model.dart';
import 'note_state.dart';



class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  static NoteCubit get(context)=>BlocProvider.of(context);
  bool isShown=false;

  final TextEditingController titleController=TextEditingController();
  final TextEditingController descriptionController=TextEditingController();
  final TextEditingController dateController=TextEditingController();

  var formKey=GlobalKey<FormState>();
  void dateOfDay(){
    dateController.text="${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}";
  }
  void changeShownForm(){
    isShown=!isShown;
    emit(ChangeShownFormSuccessState());
  }

  Database? database;

  String titleColum="title";
  String descriptionColum="description";
  String dateColum="date";
  String tableName="note";
  Future<void> createDatabase()async{
   await openDatabase("note.db",
    version: 1,
    onCreate: (db,version)async{
     emit(CreateTableLoadingState());
     await db.execute("CREATE TABLE $tableName(id INTEGER PRIMARY KEY,title TEXT,description TEXT,date TEXT)")
         .then((value) {
           emit(CreateTableSuccessState());
     }).catchError((error){
       emit(CreateTableErrorState(error: error.toString()));
     });
    },
   onOpen: (db){
     getNotesData(db);
   }).then((value) {
     database=value;
     print("database ${database}");
     emit(CreateDatabaseSuccessState());
   });
  }


  Future<void> insertIntoDatabase()async{
    emit(InsertIntoTableLoadingState());
    await database!.transaction((txn)  async{
      txn.rawQuery('INSERT INTO $tableName ($titleColum,$descriptionColum,$dateColum) VALUES ("${titleController.text}","${descriptionController.text}","${dateController.text}")');
    }).then((value) {
      emit(InsertIntoTableSuccessState());

    }).catchError((error){
      emit(InsertIntoTableErrorState(error: error.toString()));
    });
  }
  List<NoteModel> notes=[];
  Future<void> getNotesData(Database db)async{
    notes=[];
    emit(GetFromTableLoadingState());
    await db.rawQuery("SELECT * FROM $tableName").then((value) {
      value.forEach((element) {
        notes.add(NoteModel.fromJson(element));
      });
      print("notesss: ${notes}");
      emit(GetFromTableSuccessState());
    }).catchError((error){
      emit(GetFromTableErrorState(error: error.toString()));
    });

  }

}
