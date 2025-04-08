import 'package:flutter/material.dart';

class TodoApp extends StatelessWidget {
  TodoApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.blueAccent,
          // Text and icon color
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold, // Title bold
            fontSize: 20, // Title font size
          ),
          iconTheme: IconThemeData(
            color: Colors.white, // Icon color
          ),
        ),
      ),
      home:  HomeActivity(),
    );
  }
}

class HomeActivity extends StatefulWidget {
  HomeActivity({super.key});

  @override
  State<HomeActivity> createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  TextEditingController _TaskController=TextEditingController();

  List<String> _task=[];

  _addTask(){
    if(_TaskController.text.isNotEmpty){
      setState(() {
        _task.add(_TaskController.text);
        _TaskController.clear();
      });
    }
  }

  _showDeleteDialog(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Delete Task"),
          content: Text("Are you sure you want to delete this task?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                _deleteTask(index);
                Navigator.of(context).pop(); // Close dialog after deleting
              },
              child: Text(
                "Delete",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }


  _deleteTask(int index){
    setState(() {
      _task.removeAt(index);
    });
  }


  @override
  Widget build(BuildContext context)
  {


    final formKey=GlobalKey<FormState>();
    final ButtonStyle buttonStyle=ElevatedButton.styleFrom(
      padding: EdgeInsets.all(10),
      backgroundColor: Colors.blueAccent,
      foregroundColor: Colors.white,
      textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        title: Text("Simple To-Do Task App"),



      ),

      body:

      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [

            TextField(
              controller: _TaskController,
              decoration:
              InputDecoration(
                hintText: "Enter your task",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: IconButton(onPressed: _addTask, icon: Icon(Icons.add)),
              ),
            ),

            SizedBox(height: 20,),

            Expanded(
              child: ListView.builder(
                  itemCount: _task.length,

                  itemBuilder: (context,index){
                    return Card(
                      child: ListTile(
                        title: Text(_task[index]), // FIXED
                        trailing: IconButton(onPressed:()=> _showDeleteDialog(index), icon: Icon(Icons.delete,color: Colors.red)),
                      ),
                    );
                  }

              ),
            ),



          ],
        ),
      ),
    );

  }
}


