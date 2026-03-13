import 'package:flutter/material.dart';

class ToDoAppHomeScreen extends StatefulWidget {
  const ToDoAppHomeScreen({super.key});

  @override
  State<ToDoAppHomeScreen> createState() => _ToDoAppHomeScreenState();
}

class _ToDoAppHomeScreenState extends State<ToDoAppHomeScreen> {

  final TextEditingController _todoController = TextEditingController();
  final List<TodoTask> todoList = [];

  void addTodo(){
    if(_todoController.text.toString().trim().isEmpty){
      return;
    }
    setState(() {
      todoList.add(
          TodoTask(
              title: _todoController.text.toString().trim(),
              subTitle: "Subtitle"
          )
      );
      _todoController.clear();
    });
  }

  void deleteTodo(int index){
    todoList.removeAt(index);
    setState(() {

    });
  }

  void toggleDone(int index){
    todoList[index].taskDone = !todoList[index].taskDone!;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "ToDoApp",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24, color: Colors.white),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value){
                      setState(() {});
                    },
                    controller: _todoController,
                    decoration: InputDecoration(
                      // filled: true,
                      // fillColor: Colors.teal.shade100,
                      contentPadding: EdgeInsets.symmetric(horizontal: 2, vertical: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(0),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(0)
                        ),
                        borderSide: BorderSide(color: Colors.teal, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(0)
                        ),
                        borderSide: BorderSide(color: Colors.teal, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(0),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(0)
                        ),
                        borderSide: BorderSide(color: Colors.green, width: 2.0)
                      )
                    ),
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  child: ElevatedButton(
                    onPressed: _todoController.text.toString().trim().isEmpty ? null : () {
                      addTodo();
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.teal, width: 2.0),
                      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.only(
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(10)
                          )
                      ),
                    ),
                    child: Text("Add Todo", style: TextStyle(color: Colors.teal, fontSize: 17)),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: todoList.isEmpty ? Center(child: Text("No data found"),) : ListView.builder(
          padding: EdgeInsets.only(bottom: 40, top: 8, left: 8, right: 8),
          itemCount: todoList.length,
          itemBuilder: (BuildContext context, index){
            return Card(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.teal.shade100
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight
                  )
                ),
                child: Dismissible(
                    key: Key(todoList[index].title.toString() + index.toString()),
                    child: ListTile(
                      title: Text(
                        "${todoList[index].title}",
                        style: TextStyle(
                          decoration: todoList[index].taskDone! ? TextDecoration.lineThrough : TextDecoration.none
                        ),
                      ),
                      trailing: Checkbox(value: todoList[index].taskDone, onChanged: (value){
                        toggleDone(index);
                      }),
                    ),
                  onDismissed: (_) => deleteTodo(index),
                )
              )
            );
          })
    )
        ],
      ),
    );
  }
}

class TodoTask {

   String? title;
   String? subTitle;
   bool? taskDone;

   TodoTask({
    required this.title,
    required this.subTitle,
    this.taskDone = false
  });

}