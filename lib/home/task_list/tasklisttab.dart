import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/home/task_list/itemtaskwidget.dart';
import 'package:todolist/mytheme.dart';

class TaskListTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Column(
children: [
  CalendarTimeline(
    initialDate: DateTime.now(),
    firstDate: DateTime.now().subtract(Duration(days: 45)),
    lastDate: DateTime.now().add(Duration(days: 365)),
    onDateSelected: (date) => print(date),
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
        itemBuilder: (context,index){
          return Itemtaskwidget();
        },
      itemCount: 20,

    ),
  )

],
      ),
    );
  }
}
