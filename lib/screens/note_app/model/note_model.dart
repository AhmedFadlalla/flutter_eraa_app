class NoteModel{
  final int id;
  final String title;
  final String description;
  final String date;

  NoteModel({
    required this.id,required this.title,required this.description,required this.date});

 factory NoteModel.fromJson(Map<String,dynamic> json)=>NoteModel(
     id: json["id"], title: json["title"],
     description: json["description"], date: json["date"]);
}