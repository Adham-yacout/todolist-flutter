import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/home/settings/settingstab.dart';
import 'package:todolist/home/task_list/tasklistbottomsheet.dart';
import 'package:todolist/home/task_list/tasklisttab.dart';
import 'package:todolist/mytheme.dart';

class homescreen extends StatefulWidget {
  static const String routename='Home';

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  int selectedindex=1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("To Do List",
          style: Theme.of(context).primaryTextTheme .displayLarge,),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() {
  showaddtaskbottomsheet();
        },
      child: Icon(Icons.add,size: 25,),
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 4,color: Mythemdata.whitecolor),
            borderRadius: BorderRadius.circular(100)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(

          currentIndex: selectedindex,
          onTap: (index){
          selectedindex=index;
          setState(() {

          });

          },
          items: [
            BottomNavigationBarItem(icon:  ImageIcon(AssetImage('assets/images/menuicon.png')),label: 'Menu'),
            BottomNavigationBarItem(icon:  ImageIcon(AssetImage('assets/images/settingsicon.png')),label:'Settings'),

          ],
        ),
      ),

body: tabs[selectedindex],
    );
  }
List<Widget> tabs=[
  TaskListTab(),SettingsTab()
];
  void showaddtaskbottomsheet() {
    showModalBottomSheet(
        context: context,
        builder: (context)=>TaskListBottomSheet(),
    );
  }
}
