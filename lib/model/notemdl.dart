class Notemdl {
  final int? id;
  final String? title;
  final String? description;
Notemdl({this.id, required this.title, required this.description});
Map <String, dynamic> toMap(){
  return {
    'id':id,
    'title': title,
    'description': description,
  };
}
factory Notemdl.fromMap(Map<String, dynamic> map) {
  return Notemdl(
    id: map['id'],
    title: map['title'],
    description: map['description'], 
  );
}
}