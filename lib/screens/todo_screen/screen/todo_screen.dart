import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/model/task_model.dart';
import 'package:flutter_test_app/screens/todo_screen/cubit/todo_cubit.dart';
import 'package:flutter_test_app/screens/todo_screen/cubit/todo_state.dart';

class ToDoScreen extends StatelessWidget {
  const ToDoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(),
      child: BlocConsumer<TodoCubit, TodoState>(
        listener: (context, state) {
          var cubit=TodoCubit.get(context);

          if(state is AddTaskSuccessState){
            cubit.clearAllData();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          var cubit=TodoCubit.get(context);
          return DefaultTabController(
            length: 3,
            child: Scaffold(
              backgroundColor: Colors.black,
              floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: Colors.black,
                            shape: Border.all(color: Colors.amber),
                            title: Text(
                              "Add Task",
                              style: TextStyle(color: Colors.amber),
                            ),
                            content: Form(
                              key: cubit.formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: cubit.titleController,
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return 'Field must not be empty';
                                      }
                                      return null;
                                    },
                                    style: TextStyle(color: Colors.amber),
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(15),
                                            borderSide:
                                            BorderSide(color: Colors.amber)),
                                        errorBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(15),
                                            borderSide:
                                            BorderSide(color: Colors.amber)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(15),
                                            borderSide:
                                            BorderSide(color: Colors.amber)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(15),
                                            borderSide:
                                            BorderSide(color: Colors.amber)),
                                        hintText: "Title",
                                        hintStyle:
                                        TextStyle(color: Colors.amber)),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: cubit.dateController,
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return 'Field must not be empty';
                                      }
                                      return null;
                                    },
                                    style: TextStyle(color: Colors.amber),
                                    keyboardType: TextInputType.none,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          borderSide:
                                          BorderSide(color: Colors.amber)),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          borderSide:
                                          BorderSide(color: Colors.amber)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          borderSide:
                                          BorderSide(color: Colors.amber)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          borderSide:
                                          BorderSide(color: Colors.amber)),
                                      hintText: "Date",
                                      hintStyle: TextStyle(color: Colors.amber),
                                    ),
                                    onTap: () async {
                                      final value = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime(2050));
                                      if (value != null) {
                                        cubit.dateController.text =
                                        "${value.year}-${value.month}-${value
                                            .day}";
                                      }
                                    },
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: cubit.timeController,
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return 'Field must not be empty';
                                      }
                                      return null;
                                    },
                                    style: TextStyle(color: Colors.amber),
                                    keyboardType: TextInputType.none,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          borderSide:
                                          BorderSide(color: Colors.amber)),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          borderSide:
                                          BorderSide(color: Colors.amber)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          borderSide:
                                          BorderSide(color: Colors.amber)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          borderSide:
                                          BorderSide(color: Colors.amber)),
                                      hintText: "Time",
                                      hintStyle: TextStyle(color: Colors.amber),
                                    ),
                                    onTap: () async {
                                      final value = await showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay(
                                              hour: 12, minute: 00));

                                      if (value != null) {
                                        cubit.timeController.text =
                                        "${value.hour}:${value.minute}";
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              Center(
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                                    onPressed: (){
                                     if(cubit.formKey.currentState!.validate()){
                                       cubit.addTask(task: TaskModel(
                                           title: cubit.titleController.text,
                                           date: cubit.dateController.text,
                                           time: cubit.timeController.text));
                                     }

                                    }, child:Text("Add",style: TextStyle(
                                  color: Colors.white
                                ),) ),
                              )
                            ],
                          );
                        });
                  },
                  backgroundColor: Colors.amber,
                  child: Icon(Icons.add)),
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: Text(
                  "To Do App",
                  style: TextStyle(fontSize: 18),
                ),
                bottom: TabBar(tabs: [
                  Tab(
                    text: "Tasks",
                  ),
                  Tab(
                    text: "Done",
                  ),
                  Tab(
                    text: "Archive",
                  )
                ]),
              ),
              body: TabBarView(children: [
                BlocConsumer<TodoCubit, TodoState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {

                    return cubit.tasks.isNotEmpty? ListView.separated(
                        itemBuilder: (context,index)=>
                        Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.amber)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(cubit.tasks[index].title,style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white
                                  ),),
                                  SizedBox(height: 4,),
                                  Text(cubit.tasks[index].date,style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey
                                  ),),
                                  SizedBox(height: 4,),
                                  Text(cubit.tasks[index].time,style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey
                                  ),),
                                ],
                              ),
                            ),
                            IconButton(onPressed: (){
                              cubit.addDoneTask(index);
                            }, icon: Icon(Icons.done,color: Colors.amber,size: 28,))
                          ],
                        ),
                      ),
                    ),
                        separatorBuilder: (context,index)=>SizedBox(height: 8,),
                        itemCount: cubit.tasks.length):Center(
                          child: Text("No Data Available",style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber

                    ),),
                        );
                  },
                ),
                BlocConsumer<TodoCubit, TodoState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {

                    return cubit.done.isNotEmpty? ListView.separated(itemBuilder: (context,index)=>
                        Container(

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(color: Colors.amber)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(cubit.done[index].title,style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.white
                                      ),),
                                      SizedBox(height: 4,),
                                      Text(cubit.done[index].date,style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.grey
                                      ),),
                                      SizedBox(height: 4,),
                                      Text(cubit.done[index].time,style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.grey
                                      ),),
                                    ],
                                  ),
                                ),
                                IconButton(onPressed: (){}, icon: Icon(Icons.done,color: Colors.amber,size: 28,))
                              ],
                            ),
                          ),
                        ),
                        separatorBuilder: (context,index)=>SizedBox(height: 8,),
                        itemCount: cubit.done.length):Center(
                      child: Text("No Data Available",style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber

                      ),),
                    );
                  },
                ),
                Text("Archive", style: TextStyle(color: Colors.white)),
              ]),
            ),
          );
        },
      ),
    );
  }
}
