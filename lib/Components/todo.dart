//the class for todo items

class Todo {
  String title;
  String id;
  bool done;

  Todo({
    required this.title,
    required this.id,
    required this.done,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(title: json['title'], id: json['id'], done: json['done']);
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'done': done,
    };
  }
}
