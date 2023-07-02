import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/model/task_model.dart';
import 'package:flutter_test_app/screens/todo_screen/cubit/to_do_cubit.dart';
import 'package:flutter_test_app/screens/todo_screen/cubit/to_do_state.dart';

class ToDoScreen extends StatelessWidget {
  const ToDoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToDoCubit(),
      child: BlocConsumer<ToDoCubit, ToDoState>(
        listener: (context, state) {
          if (state is AddTaskSuccessState) {
            ToDoCubit.get(context).deleteControllerData();
          }
          if(state is DeleteControllerSuccessState){
            Navigator.pop(context);
          }

        },
        builder: (context, state) {
          var cubit = ToDoCubit.get(context);
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
                          title: Text("Add Task"),
                          content: Container(
                            height: 300,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: cubit.titleController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      hintText: "Title"),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.none,
                                  controller: cubit.dateController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      hintText: "Date"),
                                  onTap: () async {
                                    await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime(2025))
                                        .then((value) {
                                      cubit.dateController.text =
                                          "${value!.day}-${value.month}-${value.year}";
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  controller: cubit.descriptionController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      hintText: "Description"),
                                  onTap: () async {},
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                TextFormField(
                                  controller: cubit.timeController,
                                  keyboardType: TextInputType.none,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      hintText: "Time"),
                                  onTap: () {
                                    showTimePicker(
                                            context: context,
                                            initialTime:
                                                TimeOfDay(hour: 12, minute: 0))
                                        .then((value) {
                                      cubit.timeController.text =
                                          "${value!.hour}:${value.minute}";
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  cubit.addTask(TaskModel(
                                      task: cubit.titleController.text,
                                      description:
                                          cubit.descriptionController.text,
                                      date: cubit.dateController.text,
                                      time: cubit.timeController.text));
                                },
                                child: Text("Add Task"))
                          ],
                        );
                      });
                },
                child: Icon(Icons.add),
              ),
              appBar: AppBar(
                backgroundColor: Colors.black,
                title: Text("To Do App"),
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
              body: TabBarView(
                children: [
                  cubit.myTasks.isNotEmpty?
                  ListView.separated(
                      itemBuilder: (context, index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(color: Colors.amber)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              cubit.myTasks[index].task,
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              cubit.myTasks[index].date,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                            Text(
                                              cubit.myTasks[index].time,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ],
                                        ),
                                      ),
                                      IconButton(onPressed: (){
                                        cubit.addDoneTasks(index);
                                      }, icon: Icon(Icons.done,color: Colors.amber,size: 32,))
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 8,
                          ),
                      itemCount: cubit.myTasks.length):Text("No Data Available",
                  style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: 22
                  ),),
                  cubit.doneTasks.isNotEmpty?
                  ListView.separated(
                      itemBuilder: (context, index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(color: Colors.amber)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cubit.doneTasks[index].task,
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          cubit.doneTasks[index].date,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        Text(
                                          cubit.doneTasks[index].time,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(onPressed: (){
                                    cubit.addArchiveTask(index);
                                  }, icon: Icon(Icons.done,color: Colors.amber,size: 32,))
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 8,
                      ),
                      itemCount: cubit.doneTasks.length):Text("No Data Available",
                    style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                        fontSize: 22
                    ),),
                  cubit.archiveTasks.isNotEmpty?
                  ListView.separated(
                      itemBuilder: (context, index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(color: Colors.amber)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cubit.archiveTasks[index].task,
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          cubit.archiveTasks[index].date,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        Text(
                                          cubit.archiveTasks[index].time,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 8,
                      ),
                      itemCount: cubit.archiveTasks.length):Text("No Data Available",
                    style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                        fontSize: 22
                    ),),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
