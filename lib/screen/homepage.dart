import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo_app/model/todo.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Todo> todos = dataTodo;

  @override
  Widget build(BuildContext context) {
    AppBar MyAppbar = AppBar(
      title: Text("Todo App"),
      centerTitle: true, // membuat title di tengah
      elevation: 0, // membuat apa lupa gw
      backgroundColor:
          Colors.transparent, // membuat background appabr transparant
    );

// menhitung tinggi dai appbar ke bawah secara keseluruhan
    double heightBody = MediaQuery.of(context).size.height -
        MyAppbar.preferredSize.height -
        MediaQuery.of(context).padding.top;
// menghitung tinggi dari appbar keatas secara keseluruhan
    double widthBody = MediaQuery.of(context).size.width;

//funtion search atau pencarian
    void searchTodo(String query) {
      final todoFilter = dataTodo.where((todo) {
        final input = query.toLowerCase();
        final todoTitle = todo.tittle.toLowerCase();
        return todoTitle.contains(input);
      }).toList();
      setState(() {
        todos = todoFilter;
      });
    }

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "add_todo");
          },
          child: Icon(Icons.add),
        ),
        appBar: MyAppbar,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                width: widthBody,
                height: heightBody * 0.15,
                color: Colors.transparent,
                // ignore: prefer_const_constructors
                child: TextField(
                  onChanged: searchTodo,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search),
                      hintText: "Cari Variable"),
                ),
              ),
              todos.length != 0
                  ? Container(
                      //padding: EdgeInsets.symmetric(horizontal: ),
                      height: heightBody * 0.85,
                      width: widthBody,
                      color: Colors.transparent,
                      child: ListView.builder(
                        itemCount: todos.length,
                        itemBuilder: (context, index) {
                          final todo = todos[index];
                          return CheckboxListTile(
                            secondary: IconButton(
                                onPressed: () {
                                  setState(() {
                                    todos.removeAt(index);
                                  });
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text(
                              todo.tittle,
                              style: TextStyle(
                                  fontSize: 18,
                                  decoration: todo.isCompleted
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none),
                            ),
                            subtitle: Text(
                              todo.desc,
                              style: TextStyle(fontSize: 10),
                            ),
                            value: todo.isCompleted,
                            onChanged: (value) {
                              setState(() {
                                todo.isCompleted = value!;
                              });
                            },
                          );
                        },
                      ))
                  : Container(
                      child: Text("data kosong"),
                    ),
            ],
          ),
        ));
  }
}
