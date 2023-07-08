

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/const/dio/dio_helper.dart';
import 'package:flutter_test_app/screens/world_timer_app/cubit/world_timer_state.dart';
import 'package:meta/meta.dart';

import '../../../const/end_points/end_points.dart';



class WorldTimerCubit extends Cubit<WorldTimerState> {
  WorldTimerCubit() : super(WorldTimerInitial());


  static WorldTimerCubit get(context)=>BlocProvider.of(context);



  List<String> regions=[];

  String? selectedRegion;

  void changeSelectedRegion(String value){
    selectedRegion=value;

    emit(ChangeSelectedRegionSuccessState());
  }

  Future<void> getRegionData()async{
    emit(GetRegionDataLoadingState());
    final response=await DioHelper.getData(url: EndPoints.region);

    if(response.statusCode==200){
      response.data.forEach((element){
        regions.add(element);
      });
      emit(GetRegionDataSuccessState());
    }else{
      emit(GetRegionDataErrorState(error: response.data));
    }

  }

}
