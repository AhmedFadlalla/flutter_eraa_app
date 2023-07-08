
abstract class NoteState {}

class NoteInitial extends NoteState {}
class ChangeShownFormSuccessState extends NoteState {}



class CreateTableLoadingState extends NoteState {}
class CreateTableSuccessState extends NoteState {}
class CreateTableErrorState extends NoteState {
  final String error;

  CreateTableErrorState({required this.error});
}

class InsertIntoTableLoadingState extends NoteState {}
class InsertIntoTableSuccessState extends NoteState {}
class InsertIntoTableErrorState extends NoteState {
  final String error;

  InsertIntoTableErrorState({required this.error});
}

class GetFromTableLoadingState extends NoteState {}
class GetFromTableSuccessState extends NoteState {}
class GetFromTableErrorState extends NoteState {
  final String error;

  GetFromTableErrorState({required this.error});
}

class CreateDatabaseSuccessState extends NoteState {}