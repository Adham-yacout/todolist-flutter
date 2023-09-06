import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskListBottomSheet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          
          Text("Add new task",
          textAlign: TextAlign.center,
          style: Theme.of(context).primaryTextTheme.titleMedium,),
          Form(
            child: Column(
              children:[
                TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter Task",

                ),
              ),
                SizedBox(height: 10,),
                TextFormField
                  ( maxLines: 4,
                  minLines: 1,
                  decoration: InputDecoration(
                    hintText: "Enter task description",

                  ),
                ),
              ] ,
            ),
          ),
          SizedBox(height: 18,),
          Text("select date",style: Theme.of(context).primaryTextTheme.titleMedium,),
          SizedBox(height: 18,),
          InkWell(onTap: (){
            //show calendar
          },
              child: Text("select date",style: Theme.of(context).primaryTextTheme.titleMedium,)),
          SizedBox(height: 50,),
          ElevatedButton(onPressed: (){}, child: Text('Add',
          style: Theme.of(context).primaryTextTheme.displayLarge,),
          )
        ],
      ),
    );
  }
}
