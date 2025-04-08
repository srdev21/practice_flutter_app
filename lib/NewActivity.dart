import 'package:flutter/material.dart';

import 'NewActivity2.dart';
class NewActivity extends StatelessWidget {
  NewActivity({super.key});


  @override
  Widget build(BuildContext context)
  {
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
        title: Text("New Activity"),


      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(

              child:
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>NewActivity2()));
              },
                child:
                Text("Go to Second Activity",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                ),
                style: ButtonStyle(

                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                ),

              ),
            )
          ]
      ),

    );

  }
}