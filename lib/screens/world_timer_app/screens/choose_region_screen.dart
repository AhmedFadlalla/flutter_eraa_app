import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/screens/world_timer_app/cubit/world_timer_cubit.dart';
import 'package:flutter_test_app/screens/world_timer_app/cubit/world_timer_state.dart';

class ChooseRegionScreen extends StatelessWidget {
  const ChooseRegionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<WorldTimerCubit, WorldTimerState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit=WorldTimerCubit.get(context);
          if(cubit.regions.isNotEmpty){
            return Column(
              children: [

                DropdownButtonHideUnderline(child: DropdownButton2(
                    hint: Text(cubit.selectedRegion??"Choose Selected Region"),
                    onChanged: (value) {
                      cubit.changeSelectedRegion(value!);
                    },
                    items: cubit.regions.map((value) =>
                        DropdownMenuItem(
                            value: value,
                            child: Text(
                                value
                            ))).toList()),),
              ],
            );
          }
          if(cubit.regions.isEmpty){
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return Container();
        },
      ),
    );
  }
}
