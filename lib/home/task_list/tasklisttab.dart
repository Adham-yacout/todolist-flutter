import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/firebase_utils.dart';
import 'package:todolist/home/task_list/itemtaskwidget.dart';
import 'package:todolist/model/Task.dart';
import 'package:todolist/mytheme.dart';
import 'package:todolist/provider/listprovider.dart';

class TaskListTab extends StatefulWidget {
  @override
  State<TaskListTab> createState() => _TaskListTabState();
}

class _TaskListTabState extends State<TaskListTab> {


  @override
  Widget build(BuildContext context) {
var provider=Provider.of<listprovider>(context);
     provider.getalltaskfromfirestore();


    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: provider.selectedate,
            firstDate: DateTime.now().subtract(Duration(days: 45)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) {
           provider.changeselectedate(date);
            },
            leftMargin: 20,
            monthColor: Mythemdata.blacklight,
            dayColor: Mythemdata.blacklight,
            activeDayColor: Mythemdata.primarylight,
            activeBackgroundDayColor: Mythemdata.whitecolor,
            dotsColor: Color(0xFF333A47),
            selectableDayPredicate: (date) => true,
            locale: 'en_ISO',
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Itemtaskwidget(task: provider.tasklist[index],);
              },
              itemCount: provider.tasklist.length,

            ),
          )

        ],

      ),
    );
  }





}

