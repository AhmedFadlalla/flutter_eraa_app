import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/screens/note_app/note_cubit/note_cubit.dart';
import 'package:flutter_test_app/screens/note_app/note_cubit/note_state.dart';

class FormFieldsComponent extends StatelessWidget {
  const FormFieldsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteCubit, NoteState>(
      listener: (context, state) {
        var cubit=NoteCubit.get(context);

        if(state is InsertIntoTableSuccessState){
          cubit.titleController.text='';
          cubit.descriptionController.text='';
          cubit.isShown=false;
          cubit.getNotesData(cubit.database!);
        }
      },
      builder: (context, state) {
        var cubit=NoteCubit.get(context);
        return ConditionalBuilder(
            condition: state is! InsertIntoTableLoadingState,
            builder: (context)=>Form(
          key: cubit.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: cubit.titleController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Field must not be empty";
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    label: Text("Title"),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(height: 8,),
              TextFormField(
                controller: cubit.descriptionController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Field must not be empty";
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(

                    label: Text("Description"),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(height: 8,),
              TextFormField(
                controller: cubit.dateController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Field must not be empty";
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(

                    label: Text("Date"),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(height: 8,),
              Container(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if(cubit.formKey.currentState!.validate()){
                          cubit.insertIntoDatabase();
                        }
                      },
                      child: Text("Save"))),
            ],
          ),
        ),
            fallback: (context)=>CircularProgressIndicator());
      },
    );
  }
}
