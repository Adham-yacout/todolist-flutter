import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todolist/model/Task.dart';
//"{}" json object
//"[]" json array
CollectionReference<Task> getTaskCollection(){
 return FirebaseFirestore.instance.collection('task')
      .withConverter<Task>(
      fromFirestore: ((snapshot,options)=>Task.fromjson(snapshot.data()!)),
      toFirestore: (task,options)=>task.tojson());
}
Future<void> addTasktoFirestore( Task task){
var collection=getTaskCollection();
var docref=collection.doc();
task.id=docref.id;
return docref.set(task);
}
Future<void> deletetaskfromfirestore(Task task){
return getTaskCollection().doc(task.id).delete();
}