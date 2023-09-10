import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todolist/firebase_utils.dart';
import 'package:todolist/model/Task.dart';
import 'package:todolist/mytheme.dart';

class Itemtaskwidget extends StatelessWidget {
  Task task;
  Itemtaskwidget({required this.task});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 18),
      child: Slidable(
        startActionPane: ActionPane(
          // A motion is a widget used to control how the pane animates.
          motion: const ScrollMotion(),
extentRatio:0.20 ,

          // All actions are defined in the children parameter.
          children:  [
            // A SlidableAction can have an icon and/or a label.
            SlidableAction(
              onPressed: (context){
          deletetaskfromfirestore(task).timeout(Duration(milliseconds:5 ));
              },
              backgroundColor: Mythemdata.redlight,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft:Radius.circular(12)),
              label: 'Delete',
            ),

          ],
        ),

        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Mythemdata.whitecolor),
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(12),
                color: Theme.of(context).primaryColor,
                height: 100,
                width: 4,
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(task.title,
                      style:
                    Theme.of(context).primaryTextTheme.displaySmall,),
                    Text(task.description,
                      style:
                      Theme.of(context).primaryTextTheme.titleMedium,)
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).primaryColor),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                child: Icon(
                  Icons.check,
                  size: 30,
                  color: Mythemdata.whitecolor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
