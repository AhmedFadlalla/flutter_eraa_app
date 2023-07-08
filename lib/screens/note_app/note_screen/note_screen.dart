import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/screens/note_app/note_cubit/note_cubit.dart';
import 'package:flutter_test_app/screens/note_app/note_cubit/note_state.dart';

import 'component/form_field_component.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Note", style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black
        ),),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocProvider(
          create: (context) => NoteCubit()..dateOfDay()..createDatabase(),
          child: BlocConsumer<NoteCubit, NoteState>(
            listener: (context, state) {
              if(state is CreateTableErrorState){
                print("errorrrr :${state.error}");
              }
            },
            builder: (context, state) {
              NoteCubit cubit=NoteCubit.get(context);
             return ConditionalBuilder(
                 condition: state is! CreateTableLoadingState,
                 builder: (context)=>SingleChildScrollView(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Switch(value: cubit.isShown,
                           onChanged: (value) {
                             cubit.changeShownForm();
                           }),
                       if(cubit.isShown==true)
                         FormFieldsComponent(),
                       SizedBox(height: 8,),
                       Text("Notes", style: TextStyle(
                           fontWeight: FontWeight.bold,
                           fontSize: 13
                       ),),
                       GridView.count(
                           crossAxisCount: 2,
                           crossAxisSpacing: 8,
                           shrinkWrap: true,
                           physics: BouncingScrollPhysics(),
                           mainAxisSpacing: 15,
                           childAspectRatio: 19 / 11,

                           children: List.generate(cubit.notes.length, (index) =>
                               Container(
                                 decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(15),
                                     color: Colors.white,
                                     boxShadow: [
                                       BoxShadow(
                                           offset: Offset(0, 1),
                                           spreadRadius: 1,
                                           color: Color(0xff000000).withOpacity(
                                               0.2)
                                       )
                                     ]
                                 ),
                                 child: Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Column(
                                     children: [
                                       Row(
                                         mainAxisAlignment: MainAxisAlignment
                                             .spaceBetween,
                                         children: [
                                           Text(cubit.notes[index].title, style: TextStyle(
                                               fontSize: 14,
                                               fontWeight: FontWeight.bold
                                           ),),
                                           Text(cubit.notes[index].date,
                                             style: TextStyle(
                                                 color: Colors.grey,
                                                 fontSize: 12
                                             ),)
                                         ],
                                       ),
                                       Text(
                                         cubit.notes[index].description,
                                         style: TextStyle(
                                             fontSize: 16,
                                             fontWeight: FontWeight.w400
                                         ),
                                         maxLines: 3,)
                                     ],
                                   ),
                                 ),
                               ))),
                     ],
                   ),
                 ),
                 fallback: (context)=>CircularProgressIndicator());

            },
          ),
        ),
      ),
    );
  }
}
