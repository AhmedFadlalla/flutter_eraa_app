
abstract class WorldTimerState {}

class WorldTimerInitial extends WorldTimerState {}
class ChangeSelectedRegionSuccessState extends WorldTimerState {}
class GetRegionDataLoadingState extends WorldTimerState {}
class GetRegionDataSuccessState extends WorldTimerState {}
class GetRegionDataErrorState extends WorldTimerState {
  final dynamic error;

  GetRegionDataErrorState({
    required this.error});
}
