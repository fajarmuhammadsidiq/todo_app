// template dari data kita

class Todo {
  final String id;
  final String tittle;
  final String desc;
  bool isCompleted;

  Todo(
      {required this.id,
      required this.tittle,
      required this.desc,
      this.isCompleted = false});
}

List<Todo> dataTodo = [
  Todo(
      id: DateTime.now().toString(),
      tittle: "Mengerjakan tugas",
      desc: "tugas kuliah"),
  Todo(
      id: DateTime.now().toString(),
      tittle: "memasak ikan",
      desc: "ikan bawal"),
];
