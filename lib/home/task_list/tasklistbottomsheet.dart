import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/firebase_utils.dart';
import 'package:todolist/model/Task.dart';

class TaskListBottomSheet extends StatefulWidget {
  @override
  State<TaskListBottomSheet> createState() => _TaskListBottomSheetState();
}

class _TaskListBottomSheetState extends State<TaskListBottomSheet> {
  DateTime selectedate = DateTime.now();
  String title = '';
  String description = '';
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Add new task",
            textAlign: TextAlign.center,
            style: Theme.of(context).primaryTextTheme.titleMedium,
          ),
          Form(
            key: formkey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter Task",
                  ),
                  onChanged: (text) {
                    title = text;
                  },
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return "please enter task title";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  maxLines: 4,
                  minLines: 1,
                  decoration: InputDecoration(
                    hintText: "Enter task description",
                  ),
                  onChanged: (text) {
                    description = text;
                  },
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return "please enter task description";
                    } else {
                      return null;
                    }
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Text(
            "select date",
            style: Theme.of(context).primaryTextTheme.titleMedium,
          ),
          SizedBox(
            height: 18,
          ),
          InkWell(
              onTap: () {
                choosendate();
              },
              child: Text(
                '${selectedate.month}/${selectedate.day}/${selectedate.year}',
                style: Theme.of(context).primaryTextTheme.titleMedium,
              )),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () {
              addtask();
            },
            child: Text(
              'Add',
              style: Theme.of(context).primaryTextTheme.displayLarge,
            ),
          )
        ],
      ),
    );
  }

  void choosendate() async {
    var choosendate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));

    if (choosendate != null) {
      selectedate = choosendate;
      setState(() {});
    }
  }

  void addtask() {
    if (formkey.currentState?.validate() == true) {
      Task task = Task(
          title: title,
          description: description,
          date: selectedate.millisecondsSinceEpoch);
      addTasktoFirestore(task).timeout(Duration(milliseconds: 500),
          onTimeout: () {
        print("task added");
        Navigator.pop(context);
      });
    }
  }
}
