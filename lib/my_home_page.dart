import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';
import 'package:todo_hacked/task_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_hacked/widgets/ItemCard.dart';

import 'widgets/AddButton.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String inputTask;

  Task _task;

  Box<Task> todosBox;
  var _controller = SolidController();
  final FocusNode node = FocusNode();
  var ficon = Icons.add;
  final textController = TextEditingController();

  void _addTodo(Task inputTodo) {
    todosBox.add(Task(task: inputTodo.task));
  }

  @override
  Widget build(BuildContext context) {
    // notesBox.clear();
    return Scaffold(
      backgroundColor: Color(0XFF263145),
      appBar: AppBar(
        backgroundColor: Color(0XFFF6376D),
        elevation: 0,
        title: Text('Things left To Do...'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 60.0),
        child: ValueListenableBuilder(
            valueListenable: Hive.box<Task>('TODOs').listenable(),
            builder: (context, Box<Task> _notesBox, _) {
              todosBox = _notesBox;
              return ListView.builder(
                  itemCount: _notesBox.values.length,
                  itemBuilder: (BuildContext context, int index) {
                    final todo = todosBox.getAt(index);
                    return ItemCard(
                      title: todo.task,
                      onDelete: () => todosBox.deleteAt(index),
                    );
                  });
            }),
      ),
      bottomSheet: Container(
        color: Color(0XFF263145),
        child: SolidBottomSheet(
          smoothness: Smoothness.high,
          controller: _controller,
          headerBar: Container(
            color: Colors.transparent,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: AddButton(
                  ficon: ficon,
                  onPressed: () {
                    if (_controller.isOpened) {
                      textController.clear();
                      _controller.hide();
                    } else {
                      _controller.show();
               
                    }
        
                  },
                  tooltip: 'AddNewTODOTask',
                ),
              ),
            ),
          ),
          // headerBar: Container(),
          body: Container(
            color: Color(0XFF333F55),
            child: Column(
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextField(
                          controller: textController,
                          focusNode: node,
                          style: TextStyle(color: Color(0XFFDEEAF8)),
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: Color(0XFFB3C6EA)),
                            hintText: 'Type something...',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0XFFF6376D),
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0XFFF6376D),
                              ),
                            ),
                          ),
                          onChanged: (value) => inputTask = value,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FlatButton(
                                color: Color(0XFFF6376D),
                                onPressed: () {
                                  _task = Task(task: inputTask);
                                  _addTodo(_task);
                                  textController.clear();
                                  _controller.hide();
                                },
                                child: Text('Add'),
                              ),
                              FlatButton(
                                color: Color(0XFFF6376D),
                                onPressed: () {
                                  textController.clear();
                                  _controller.hide();
                                },
                                child: Text('Cancel'),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // remove the deleted index holes/slots from database
    // to free up the space
    todosBox.compact();

    todosBox.close();
    super.dispose();
  }
}
