import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:todolist/firebase_utils.dart';
import 'package:todolist/model/Task.dart';

class listprovider extends ChangeNotifier{
  List<Task> tasklist=[];
  DateTime selectedate=DateTime.now();
  getalltaskfromfirestore() async{
    QuerySnapshot<Task> querySnapshot= await getTaskCollection().get();
    tasklist= querySnapshot.docs.map((doc)
    {
      return doc.data();
    }
    ).toList();
    tasklist=  tasklist.where((task){
      DateTime dateTime =DateTime.fromMillisecondsSinceEpoch(task.date);
      if(dateTime.year==selectedate.year &&
          dateTime.month==selectedate.month &&
          dateTime.day==selectedate.day)
      {
        return true;
      }
      return false;
    }).toList();

    tasklist.sort((Task task1,Task task2)
    {
      DateTime date1=DateTime.fromMillisecondsSinceEpoch(task1.date);
      DateTime date2=DateTime.fromMillisecondsSinceEpoch(task2.date);
      return date1.compareTo(date2);
    });

  notifyListeners();
  }
  changeselectedate(DateTime newdate){
    selectedate=newdate;
    notifyListeners();
  }
}