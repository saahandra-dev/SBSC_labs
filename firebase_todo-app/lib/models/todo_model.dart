class Todo {
  final int id;
  final String name;
  final DateTime date;
  final bool completed;

  const Todo({
    this.id,
    this.name,
    this.date,
    this.completed,
  });

  Todo copyWith({
    int id,
    String name,
    DateTime date,
    bool completed,
  }) {
    return Todo(
      id: id ?? this.id,
      name: name ?? this.name,
      date: date ?? this.date,
      completed: completed ?? this.completed,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'date': date.toIso8601String(),
      'completed': completed ? 1 : 0,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'] as int,
      name: map['name'] as String,
      date: DateTime.parse(map['date'] as String),
      completed: map['completed'] as int == 1,
    );
  }
}
