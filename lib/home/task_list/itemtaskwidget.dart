import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/mytheme.dart';

class Itemtaskwidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                Text("play hamada",
                  style:
                Theme.of(context).primaryTextTheme.displaySmall,),
                Text("description",
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
    );
  }
}
