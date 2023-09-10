class Task{
  String id;
  String title;
  String description;
  bool isdone;
  int date;
  Task(
  {
    this.id='',
    required this.title,
    required this.description,
    this.isdone=false,
    required this.date,
}
      );
Task.fromjson(Map<String,dynamic> json):this(
  id:json["id"] as String,
  title:json["title"] as String,
  date: json["date"] as int,
  description:json["description"] as String ,
  isdone: json["isdone"] as bool,
);
 Map<String,dynamic> tojson(){
    return  {
      "id":id,
      "title":title,
      "description":description,
      "date":date,
      "isdone":isdone,
    };
  }
}