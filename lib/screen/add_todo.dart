import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo_app/model/todo.dart';

class AddTodo extends StatelessWidget {
  const AddTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerTittle = TextEditingController();
    TextEditingController controllerdeskripsi = TextEditingController();
    AppBar MyAppbar = AppBar(
      title: Text("Add Todo"),
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
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (controllerTittle.text.length != 0 ||
              controllerdeskripsi.text.length != 0) {
            print(dataTodo);
          }
          dataTodo.add(Todo(
            id: DateTime.now().toString(),
            tittle: controllerTittle.text.length == 0
                ? "No Tittle"
                : controllerTittle.text,
            desc: controllerdeskripsi.text.length == 0
                ? "No deskripsi"
                : controllerdeskripsi.text,
          ));
          print(dataTodo);
          Navigator.pop(context);
        },
        child: Icon(Icons.add_task),
      ),
      appBar: MyAppbar,
      body: Container(
        padding: EdgeInsets.all(20),
        width: widthBody,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white12),
              child: TextField(
                controller: controllerTittle,
                maxLength: 20,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                    hintText: "judul", border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: heightBody * 0.05,
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white12),
              child: TextField(
                controller: controllerdeskripsi,
                maxLines: 10,
                maxLength: 100,
                style: TextStyle(),
                decoration: InputDecoration(
                    hintText: "deskripsi", border: InputBorder.none),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
