class Todo {
  String? uuid;
  String? title;
  String? description;

  Todo({
    this.uuid,
    this.title,
    this.description,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        uuid: json["UUID"],
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "UUID": uuid,
        "title": title,
        "description": description,
      };
}
